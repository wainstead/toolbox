#!/opt/perl5/bin/perl -w

# $Id: packageActions.pl,v 1.3 2004/05/13 20:12:52 swain Exp $

# The query is taken from what was originally packageActions.py,
# written by SystemsFusion. Query the product database for all package
# actions.

use strict;
use DBI;

my %dbinfo = getConfig('Database');

die unless ($dbinfo{'Password'});

#print $dbinfo{'Database'}, $dbinfo{'Password'};

my $prod = DBI->connect("dbi:DB2:$dbinfo{Database}", "evwprod", $dbinfo{'Password'}, { 'RaiseError' => 1, AutoCommit => 1 });


# by omitting the WHERE clause, we search the entire history.

my $query = <<QUERY;
   SELECT  
      packageActions.organisationDn, 
      packageActions.actionTime,  
      packageActions.evwPackageId, 
      LOWER(packageActions.packageAction), 
      packageActions.ispDn, 
      domainHistory.fqdn, 
      packageActions.productId 
   FROM 
      packageActions LEFT OUTER JOIN domainHistory 
        ON domainHistory.installedProductId = packageActions.productId 
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

print "-- ORGANIZATIONDN\tACTIONTIME\tEVWPACKAGEID\tPACKAGEACTION\tISPDN\tFQDN\tPRODUCTID\n";
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


# $Log: packageActions.pl,v $
# Revision 1.3  2004/05/13 20:12:52  swain
# Omitting "ORDER BY".
#
# Revision 1.2  2004/05/13 19:40:19  swain
# Added counter so we can see progress.
#
# Revision 1.1  2004/05/13 19:35:38  swain
# First version of a Perl script to get all package activity. The query
# is taken from the original packageActivity report written in Python by
# SystemsFusion. Note this version does not take a date, but returns all
# activity for all history.
#
