#!/usr/bin/env perl5.30

# Based on Higher Order Perl, chapter 1, first example. It's a simple
# recursion example. I added a coderef though just because I'm on
# vacation and hacking for fun. I really used to write some serious
# Perl back in the day, though come to think of it, I had a pretty
# spiffy SQL statement editing tool I wrote in my last role.

use strict;
use warnings;
use feature 'state'; # for static variables

my $arg = shift @ARGV;
# optional: choose a debug level
my $debug_level = shift @ARGV;
$main::current_arg = $main::current_depth = 0;

# You have to, at least, pass a number to convert to binary. Probably
# wanna pull in some kind of arg parsing module eventually
# (https://perldoc.perl.org/Getopt/Long.html)
die "no argument given\n" unless scalar($arg);

# first debug statement; simplistic.
sub debug { print "debug: was passed $_[0]\n"; }

# Make a closure for printing debug output. Use $depth to track how
# deep the recursion goes. One expects there's a Perl variable that
# does this for us, though, since Perl has pretty much
# everything. (Actually Perl now has the C equivalent of static
# variables, called 'state')
sub makeclosure {
    my $prefix = shift;
    my $depth = 0;
    return sub { $depth++; print "$prefix: was passed $_[0] at depth $depth\n"; }
}

# second debug statement; more complex. 'UNFLY' is a synonym to
# 'DEBUG'.
my $debug2 = &makeclosure('UNFLY');

my $lookup = {
    1 => \&debug, # regular subroute, by reference
    2 => $debug2, # closure
    3 => sub {    # anonymous function using a 'state' variable
	my ($arg) = @_;
	state $depth++;
	write_report($arg, $depth);
    },
    'UNSET' => sub { "" } # if no argument given; maybe can use AUTOLOAD instead
};

# handle no argument
my $choice = $debug_level || 'UNSET';

# make sure they passed something passable
if (not exists $lookup->{$choice}) {
    die "Choice not legitimate choice.\n";
}

# ternary operator is fine for such a short line, and we handle
# coderefs in two ways.
#my $chosen_debug_statement = $debug_level ? $debug2 : \&debug;

my $chosen_debug_statement = $lookup->{$choice};

my $answer = binary($arg, $chosen_debug_statement);

print("Given: $arg the answer is $answer\n");

=pod

=head1 Quote from Higher Order Perl, page 10:

The coderef argument to hanoi() is called a *callback*, because it is
a function supplied by the caller of hanoi() that will be “called
back” to when hanoi() needs help. We sometimes also say that the
$move_disk argument of hanoi() is a *hook*, because it provides a
place where additional functionality may easily be hung.

=cut

# The main function, borrowed from HOP
sub binary {
    my ($n, $debug_routine) = @_;
    # We're using a code reference; accept any debug routine we pass
    # it. This is kinda the whole point of this script: adding a hook
    # to a function by passing in a coderef.
    $debug_routine->($n);

    return $n if $n == 1 || $n == 0;

    my $k = int($n/2);
    my $b = $n % 2;
    my $E = binary($k, $debug_routine);
    return $E . $b;
}

# Note we have to set globals, because you have to use variables
# declared in the same scope as the formats down below.
sub write_report {
    ($main::current_arg, $main::current_depth) = @_;
    write;
}

format STDOUT_TOP =
ARG          DEPTH
--------------------
.

format STDOUT = 
@<<<<<<<<<<  @<<<<<<
$main::current_arg, $main::current_depth
.
