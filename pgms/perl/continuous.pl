#!/usr/bin/perl

# demo of a continuous iterator.

use strict;
use warnings;

my $it = iterator();

for (0..20) {
    print "next: ", $it->(), "\n";
} 

sub iterator {
    my @queue = (3,5,6,2,3,5,1,2,3,1);
    return sub {
        my $val = shift @queue;
        push @queue, $val;
        print "queue now: " . join(",", @queue), "\n";
        return $val;
    }
}
