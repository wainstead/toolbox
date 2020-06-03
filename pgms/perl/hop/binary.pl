#!/usr/bin/env perl

# Based on Higher Order Perl, chapter 1, first example. It's a simple
# recursion example.

use strict;
use warnings;

#print("Hello, sailor!\n");

my $arg = shift @ARGV;
die "no argument given\n" unless length($arg);

my $answer = binary($arg);

print("Given: $arg the answer is $answer\n");


sub binary {
    my ($n) = @_;
    return $n if $n == 1 || $n == 0;

    my $k = int($n/2);
    my $b = $n % 2;
    my $E = binary($k);
    return $E . $b;
}
