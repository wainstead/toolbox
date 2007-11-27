#!/usr/bin/perl

# $Id: signals.pl,v 1.1 2007/10/05 18:19:21 swain Exp $

# Testbed for handling various signals. The goal here is to write
# signal handlers for the OFS, so we can kill a cron job and it will
# clean up after itself properly (setting all orders to failed,
# probably, would be the easiest thing.

use strict;
use warnings;

$SIG{KILL} = \&killed; # ERROR: does not work as you cannot catch KILL

$SIG{INT}  = \&interrupted;
$SIG{TERM} = \&terminated;

# this signal handler never gets called, because KILL cannot be caught
sub killed {
    die "I was killed!\n";
}

sub interrupted {
    print "Interrrupt!\n";
}

sub terminated {
    print "I'll be bahhk!\n";
    exit(0);
}

print "I'm $$\n";

my $input = <STDIN>;

print "You typed $input";
exit(0);
