#!/usr/bin/perl

# $Id: formelements.pl,v 1.3 2003/06/17 19:37:53 swain Exp $
# extract html form elements out of the soup

open FILE, "<$ARGV[0]" or die "Usage: $0 htmlfile\n";

$/ = '>';

while (<FILE>) {

    if ($flag == 1) {
        m/^[^<]+/;
        print $&;
    }

    if (/form|input|select|option|textarea/i) {
        s/^[^<]+//;
        print;
        print "\n";
        if (/<option/) { 
            $flag = 1;
        } else {
            $flag = 0;
        }
    }
}
