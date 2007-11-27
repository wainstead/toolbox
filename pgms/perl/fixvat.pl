#!/opt/perl5/bin/perl

# $Id: fixvat.pl,v 1.2 2004/01/06 17:23:12 swain Exp $
# update all costprofiles with the current tax realm ids for all visps
# author steve wainstead january 2004

use DBI;

die "Usage: $0 <dn in lowercase, e.g. 'dmfc' or 'fcty'>\n" unless $ARGV[0];

print "using: $ARGV[0]\n";
print "Checking to see if the ProductModule was stopped...\n";
my $output = `/etc/evolutionware/control.sh status ProductModule`;
if ($output =~ /Running/) {
    die "You have to stop the ProductModule before running this script, "
        . "and then restart it.\n";
} else {
    print "OK, I don't see it.\n";
}

my $billing = DBI->connect("dbi:DB2:evw", "evwbill", "112233", { 'RaiseError' => 1, AutoCommit => 1 });

my $prod = DBI->connect("dbi:DB2:evw", "evwprod", "112233", { 'RaiseError' => 1, AutoCommit => 1 });

my (%merchants, %taxids);

# get all merchant IDs
my $query = "select merchantid, merchantname from merchants_tbl";

$sth = $billing->prepare($query) or die $DBI::errstr;
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
    if ($merchant eq 'Ampira') { 
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
