#!/usr/bin/env perl

# sum.pl
# 
# This script prompts the user for a positive integer N and calculates
# the sum of all numbers from N down to 1 (N + (N-1) + (N-2) + ... + 1).
# The sum calculation is implemented in the sum_numbers() function which
# can be called independently for testing purposes.
#
# Authors: swain, Auto
# Date: January 10, 2026

use strict;
use warnings;

# Function to calculate sum of all numbers from N down to 1
sub sum_numbers {
    my ($n) = @_;
    
    unless (defined $n && $n =~ /^\d+$/ && $n > 0) {
        die "Error: Please enter a positive integer\n";
    }
    
    my $sum = 0;
    for (my $i = $n; $i >= 1; $i--) {
        $sum += $i;
    }
    
    return $sum;
}

# Main script logic - only run if not being tested
unless (caller) {
    print "Enter a number: ";
    chomp(my $n = <STDIN>);
    
    my $sum = sum_numbers($n);
    print "Sum of $n + ($n - 1) + ... + 1 = $sum\n";
}

1;
