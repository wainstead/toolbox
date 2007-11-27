#!/usr/bin/perl

# example of a basic iterator in Perl, via the HOP book
# $Id: iterator.pl,v 1.1 2006/02/25 23:16:33 swain Exp $

use strict;
use warnings;

# note the use of (&)
sub Iterator (&) { return $_[0] }

my @x = qw(1 2 3 4 5 6 7 8 42);


# create a closure
sub mi {
    my @x = @_;
    return Iterator {
        shift @x;
    }
}


my $it = &mi(@x);

print $it->();
print "\n";
print $it->();
print "\n";
print $it->();
print "\n";
print $it->();
print "\n";
print $it->();
print "\n";
print $it->();
print "\n";
print $it->();
print "\n";
