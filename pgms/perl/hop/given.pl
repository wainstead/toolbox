#!/usr/bin/env perl5.30

# given/when turned out to be nonobvious; I kept getting complaints,
# via stderr I think, that the keywords are experimental. So we'll use
# a dispatch table.

# Also used this to suss out how to use write/format, which I'd long
# forgotten.

# addendum November 2020: forgot where/when I wrote this. There's no
# output for most of the choices, so something is unfinished here,
# like we're exploring recursion or something. Simple solution is to
# print out the statements, like "print 'hello sailor'" instead of
# just returning a string.

use feature 'state';

sub debug { "Hello sailor!\n"; }
our ($current_arg, $current_depth);

my $lookup = {
    1 => \&debug,
    2 => sub { "Need a date?\n"; },
    3 => sub {
	my $arg = @_;
	state $depth++;
	write_report($arg, $depth);
    },
    'UNSET' => sub { "No choice chosen\n"; }
};

# handle no argument
my $choice = $ARGV[0] || 'UNSET';

# make sure they passed something passable
if (exists $lookup->{$choice}) {
   $lookup->{$choice}();
} else {
    print "Choice not legitimate choice.\n";
}

sub write_report {
    ($current_arg, $current_depth) = @_;
    write;
}

format STDOUT_TOP =
ARG          DEPTH
.

format STDOUT =
@<<<<<<<<<<  @<<<<<<
$current_arg, $current_depth
.
