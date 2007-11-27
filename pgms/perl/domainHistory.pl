#!/opt/perl5/bin/perl -w

# $Id: domainHistory.pl,v 1.1 2004/05/14 20:38:30 swain Exp $

# make a dump of the domain history table

use strict;
use DBI;

my %dbinfo = getConfig('Database');

die unless ($dbinfo{'Password'});

#print $dbinfo{'Database'}, $dbinfo{'Password'};

my $prod = DBI->connect("dbi:DB2:$dbinfo{Database}", "evwprod", $dbinfo{'Password'}, { 'RaiseError' => 1, AutoCommit => 1 });


# by omitting the WHERE clause, we search the entire history.

my $query = <<QUERY;
   SELECT  
HISTORYID,
FQDN,
ORGDN,
PERIOD,
EXPIRYDATE,
PREVIOUSEXPIRYDATE,
MAILDATE,
RENEWEDDATE,
RENEWCOUNT,
INITIALDATE,
INSTALLEDPRODUCTID,
VISPDN

FROM domainhistory

QUERY
    
#    ORDER BY 
#       packageActions.ispDn, 
#       packageActions.organisationDn, 
#       packageActions.actionTime


    #print "query: '$query'\n";

my $sth = $prod->prepare($query)
    or die "Couldn't prepare query: " . $DBI::errstr . "\n";

$sth->execute
    or die "Couldn't execute the query: $query\nError: $DBI::errstr\n";

my $counter = 0;

#print "HISTORYID\tFQDN\tORGDN\tPERIOD\tEXPIRYDATE\tPREVIOUSEXPIRYDATE\tMAILDATE\tRENEWEDDATE\tRENEWCOUNT\tINITIALDATE\tINSTALLEDPRODUCTID\tVISPDN\n";

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
    my $configfile = "/opt/evw/etc/ProductModule.conf";
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


# $Log: domainHistory.pl,v $
# Revision 1.1  2004/05/14 20:38:30  swain
# Make a dump of the domain history table.
#

