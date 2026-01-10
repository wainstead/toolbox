#!/usr/bin/env perl

# sum.t
#
# Unit tests for sum.pl. Tests the sum_numbers() function with various
# inputs including basic cases, edge cases, and error handling for invalid
# inputs (zero and negative numbers).
#
# Authors: swain, Auto
# Date: January 10, 2026

use strict;
use warnings;
use Test::More tests => 9;

# Load the module
require_ok('./sum.pl') or BAIL_OUT("Cannot load sum.pl");

# Test basic functionality
is(sum_numbers(1), 1, "Sum of 1 should be 1");
is(sum_numbers(2), 3, "Sum of 2 should be 3 (2+1)");
is(sum_numbers(3), 6, "Sum of 3 should be 6 (3+2+1)");
is(sum_numbers(5), 15, "Sum of 5 should be 15 (5+4+3+2+1)");
is(sum_numbers(10), 55, "Sum of 10 should be 55");

# Test edge cases
is(sum_numbers(100), 5050, "Sum of 100 should be 5050");

# Test that it dies on invalid input
eval { sum_numbers(0) };
like($@, qr/positive integer/, "Should die on zero");

eval { sum_numbers(-5) };
like($@, qr/positive integer/, "Should die on negative number");
