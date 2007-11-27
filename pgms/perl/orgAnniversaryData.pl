#!/opt/perl5/bin/perl -w

# $Id: orgAnniversaryData.pl,v 1.1 2004/05/13 20:10:22 swain Exp $

# get all organization dn's and their accountids and creation dates.

use strict;
use DBI;

my %dbinfo = getConfig('Database');

die unless ($dbinfo{'Password'});

#print $dbinfo{'Database'}, $dbinfo{'Password'};

my $billDB = DBI->connect("dbi:DB2:$dbinfo{Database}", "evwbill", $dbinfo{'Password'}, { 'RaiseError' => 1, AutoCommit => 1 });

my $query = <<QUERY;
   SELECT 
        lower(organisationdn), 
        instyear, 
        instmonth, 
        instday, 
        insthour, 
        instminute, 
        accountid 
   FROM 
        accounts, accountholders 
   WHERE 
        accounts.accountholderid = accountholders.accountholderid
QUERY


    #print "query: '$query'\n";


my $sth = $billDB->prepare($query)
    or die "Couldn't prepare query: " . $DBI::errstr . "\n";

$sth->execute
    or die "Couldn't execute the query: $query\nError: $DBI::errstr\n";

my $counter = 0;

print "-- ORGANIZATIONDN\tINSTYEAR\tINSTMONTH\tINSTDAY\tINSTHOUR\tINSTMINUTE\tACCOUNTID\n";


while (my @row = $sth->fetchrow_array) {

    $counter++;

    if (($counter % 1000) == 0) {
        print STDERR "lines received: $counter\n";
    }

    for (my $x = 0; $x < scalar(@row); $x++) {
        if (not defined($row[$x])) {
            print STDERR "undefined element in column $x\n";
            $row[$x] = "undefined";
        }
    }

    print join("\t", @row), "\n";

}


sub getConfig {
    my $pattern = shift; # should look like [Database] or [Ldap]
    #print "using pattern $pattern\n";
    my $configfile = "/opt/evw/etc/BillingModule.conf";
    my %hash;

    open CONFIGFILE, $configfile
        or die "Can't read the config file '$configfile': $!\n";

    # skip all lines up to $pattern
    while (<CONFIGFILE>) {
        next unless /\[$pattern\]/o;
        #print "found pattern: " . $_;
        last;
    }

    # make key/value pairs until the next line starting with '['
    while (<CONFIGFILE>) {
        next unless /\w/;
        last if /\[/;
        chomp;
        my ($key, $val) = split /\s*=\s*/, $_, 2;
        $hash{$key} = $val;
    }
    
    return %hash;
}


# $Id: orgAnniversaryData.pl,v 1.1 2004/05/13 20:10:22 swain Exp $ 
