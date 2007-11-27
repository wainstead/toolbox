#!/usr/bin/perl

use strict;
use warnings;

my $string = 'aabcddefghiijkkkl';

if ($string =~ /(d(?<=\1))/) {
    print "$1\n";
} else {
    print "no match.\n";
}
