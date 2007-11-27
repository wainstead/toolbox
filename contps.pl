#!/usr/bin/perl -w

# continuously run ps -auxw until we are told to exit; write sort -u
# of the results to stdout.
# $Id: contps.pl,v 1.2 2003/02/20 18:49:48 swain Exp $

use strict;

our(%proc, %sort);

$SIG{INT} = \&got_sig_quit;

# handler for interrupts
sub got_sig_quit {
    foreach my $key (keys %proc) {
        my @arr = split /\s+/, $key;
        $sort{$arr[1]} = $key;
    }
    foreach my $pid (sort keys %sort) {
        print $sort{$pid};
    }
    exit(0);
}

while (1) {
    open PIPE, "ps -auxw |" or die "Can't open pipe to ps command: $!\n";
    while (<PIPE>) {
        next if (/ps -auxw/);
        $proc{$_}++;
    }
}
