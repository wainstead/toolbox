#!/usr/bin/perl

# $Id: attr2html.pl,v 1.2 2003/05/21 16:02:14 swain Exp $

# Given dump from wizard, make HTML suitable for a form.
# use http://evw-1.dvl.ampira.com/wizard/buy/buy?debugDump=yes for input
# after you've filled out all the forms

open FILE, $ARGV[0] or die "I need a filename for input.\n";

print <<EOLN;
<html>
<form action="/wizard/signup/signup">

EOLN

print "<!-- product config: -->\n";
while (<FILE>) {
    last if /^Attributes/; # skip to the next block
    next if /^ProductConfig/;
    next unless /\w/;
    chomp;
    m/("[^"]*")/; #"
    #print "$1\n";
    $val = $1;
    m/^\s*(.+?):\s/;
    $key = "pc_$1";
    print "<input type=hidden name=$key value=$val>\n";
}

print "<!-- attributes: -->\n";
while (<FILE>) {
    next unless /\w/;
    chomp;
    m/("[^"]+")/; #"
    #print "$1\n";
    $val = $1;
    m/^\s*(.+?):\s/;
    $key = $1;
    print "<input type=hidden name=$key value=$val>\n";
}


print <<EOLN;
<input type=submit>
</form>
EOLN
