#!/opt/local/bin/perl5.30

use strict;
use warnings;

my $arrref = [1, 1, 2, 3, 5];
my ($first, @rest) = @$arrref;
print @rest, "\n";
print $first, "\n";
