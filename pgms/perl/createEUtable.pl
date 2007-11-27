#!/usr/bin/perl

# $Id: createEUtable.pl,v 1.1 2003/10/17 19:37:11 swain Exp $
# takes as input the output of:
# ldapsearch  -h db2-1.prv.ampira.com -p 400 -D "cn=Directory Manager" -w "Ld@p416." -b "o=FCTY" "(&(evworgtype=ORG)(|(evwstreetcountry=AT)(evwstreetcountry=BE)(evwstreetcountry=DJ)(evwstreetcountry=FI)(evwstreetcountry=FR)(evwstreetcountry=DE)(evwstreetcountry=GR)(evwstreetcountry=IE)(evwstreetcountry=IT)(evwstreetcountry=LU)(evwstreetcountry=NL)(evwstreetcountry=PT)(evwstreetcountry=ES)(evwstreetcountry=SE)(evwstreetcountry=GB)))" dn evwstreetcountry > EU.folk

$/ = "\n\n";

open F, "<EU.folk" or die $!;

while (<F>) {
    chomp;
    ($orgdn, $country) = split /\n/;
    $country =~ m/..$/;
    $country = $&;
    print <<"EOLN";
    db2 "insert into EU values('$orgdn', '$country')"
EOLN
}
