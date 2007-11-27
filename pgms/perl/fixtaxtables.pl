#!/opt/perl5/bin/perl

# $Id: fixtaxtables.pl,v 1.5 2005/01/31 23:49:02 swain Exp $
# update all costprofiles with the current tax realm ids for all visps
# author steve wainstead january 2004

use DBI;

die "Usage: $0 [dn in lowercase, e.g. 'dmfc' or 'fcty']\n" unless $ARGV[0];

print "using base cn: $ARGV[0]\n";
print "Checking to see if the ProductModule was stopped...\n";
my $output = `/etc/evolutionware/control.sh status ProductModule`;
if ($output =~ /Running/) {
    die "You have to stop the ProductModule before running this script, "
        . "and then restart it.\ne.g., /etc/evolutionware/control.sh stop ProductModule\n";
} else {
    print "OK, I don't see it.\n";
}

print "Enter the billing database password: ";
my $billingpw = <STDIN>;
chomp $billingpw;
print "\n";

print "Enter the prod database password: ";
my $prodpw = <STDIN>;
chomp $prodpw;
print "\n";

print "using '$billingpw' and '$prodpw'\n";


my $billing = DBI->connect("dbi:DB2:evw", "evwbill", $billingpw, { 'RaiseError' => 1, AutoCommit => 1 });

my $prod = DBI->connect("dbi:DB2:evw", "evwprod", $prodpw, { 'RaiseError' => 1, AutoCommit => 1 });

my (%merchants, %taxids);

# get all merchant IDs
my $query = "select merchantid, merchantname from merchants_tbl";

my $sth = $billing->prepare($query) or die $DBI::errstr;
$sth->execute
    or die "Couldn't execute the query: $query\nError: $DBI::errstr\n";

while (my @row = $sth->fetchrow_array) {
    next if $row[1] eq "DemoHost";
    next if $row[1] eq "HostDemo";
    #print $row[0], " ", $row[1], "\n";
    $merchants{$row[1]} = $row[0];
}


# get all taxrealmids for all merchants
foreach $merchant (keys %merchants) {
    my $query = "select taxstructureid, name, taxrate, description "
        . "from taxstructures_tbl "
        . "where merchantrealmid = $merchants{$merchant}";

    my $sth = $billing->prepare($query) or die $DBI::errstr;
    $sth->execute
        or die "Couldn't execute the query: $query\nError: $DBI::errstr\n";
    my @taxstructs;
    while (my @row = $sth->fetchrow_array) {
        push @taxstructs, $row[0];
    }

    $taxids{$merchant} = join(",", @taxstructs);

    print "merchant: $merchant $merchants{$merchant} taxstructs: $taxids{$merchant}\n";
}


# get all costprofiles for each visp

foreach $merchant (keys %merchants) {
    my $merchstr;
    if ($merchant =~ /Ampira/) { 
        # silly ampira has no name. force user to tell us the base dn.
        $merchstr = $ARGV[0];
    } else {
        $merchstr = lc($merchant);
    }
    my $query = "select costprofileid from costprofile cp, merchants_tbl m where cp.productmerchantid = m.productmerchantid and merchantdn like 'o=$merchstr%'";
    #print "$query\n";
    my $sth = $prod->prepare($query) or die $DBI::errstr;
    $sth->execute
        or die "Couldn't execute the query: $query\nError: $DBI::errstr\n";

    while (my @row = $sth->fetchrow_array) {
        push @{$merchant}, "'$row[0]'";
    }
    
    print "number of cps for $merchant: ", scalar @{$merchant}, "\n";
    if (scalar(@{$merchant}) == 0) {
        die "I didn't find any cost profiles for merchant: '$merchant'\nQuery was: $query\n";
    }
}


# we've build two hashes keyed on merchant name: one of merchant ids,
# and one with each merchant's tax ids. we've built arrays named
# after each visp, containing all cost profile ids. time to update the
# evwprod database.

foreach $merchant (keys %merchants) {
    my $query = "update costprofilecomponent set taxids='$taxids{$merchant}' "
        . "where costprofileid in "
        . "(" . join(",", @{$merchant}) . ")";
    print "updating cost profiles for $merchant...\n";
    #print $query, "\n";
    my $sth = $prod->prepare($query) or die $DBI::errstr;
    $sth->execute
        or die "Couldn't execute the query: $query\nError: $DBI::errstr\n";
}

print "all cost profiles updated.\n";



# db2 "select billingid, taxids from costprofilecomponent where billingid <> 0"

my %taxes;

$query = "select billingid, taxids from costprofilecomponent where billingid <> 0";
$sth = $prod->prepare($query) or die $DBI::errstr;
$sth->execute
    or die "Couldn't execute the query: $query\nError: $DBI::errstr\n";
while (my @row = $sth->fetchrow_array) {
    my $billingid = $row[0];
    my @taxids = split /,/, $row[1];
    foreach my $taxid (@taxids) {
        #print "insert into taxTemplate_tbl (templateId, taxId) values($billingid, $taxid)\n";
         print "'$billingid,$taxid' added from costprofilecomponent table\n";
        $taxes{"$billingid,$taxid"}++;
         $cpc++;
    }
}

print "number from costprofilecomponent: $cpc\n";


# now update the tax structures table

$query = "delete from taxtemplate_tbl";
$sth = $billing->prepare($query) or die $DBI::errstr;
$sth->execute
    or die "Couldn't execute the query: $query\nError: $DBI::errstr\n";

print "taxtemplate_tbl wiped clean. Repopulating...\n";

foreach $pair (sort keys %taxes) {
    print "Adding $pair to the taxtemplate_tbl...\n";

    my ($templateid, $taxid) = split /,/, $pair;
    my $query = "insert into taxtemplate_tbl (templateid, taxid) values ($templateid, $taxid)";
    $sth = $billing->prepare($query) or die $DBI::errstr;
    $sth->execute
        or die "Couldn't execute the query: $query\nError: $DBI::errstr\n";
    
}


print "You must now restart BOTH the ProductModule and the BillingModule.\n";
print "i.e., /etc/evolutionware/control.sh start ProductModule\n";
print "and /etc/evolutionware/control.sh restart BillingModule\n";

__END__
Here, in a nutshell, is what this script does for a given visp. In
this example we use FC Gold on staging:

as evwbill

  db2 "select merchantid, merchantname from merchants_tbl"
  # fc gold has an id of 21
  db2 "select taxstructureid, name, taxrate, description from taxstructures_tbl where merchantrealmid = 21"
  # the ids are US 61, EU 161

as evwprod

  db2 "select costprofileid from costprofile cp, merchants_tbl m where cp.productmerchantid = m.productmerchantid and merchantdn like 'o=fc gold%'"
  db2 "update costprofilecomponent set taxids='61,161' where costprofileid in (select costprofileid from costprofile cp, merchants_tbl m where cp.productmerchantid = m.productmerchantid and merchantdn like 'o=fc gold%')"
