#!/usr/bin/env perl

use strict;
use warnings;

die "Usage: $0 'NUM NUM OP'\n" unless @ARGV;

my @stack;

my $actions = {
    '+'         => sub { push @stack, pop(@stack) + pop(@stack) },
    '*'         => sub { push @stack, pop(@stack) * pop(@stack) },
    '-'         => sub { my $s = pop(@stack); push @stack, pop(@stack) - $s },
    '/'         => sub { my $s = pop(@stack); push @stack, pop(@stack) / $s },
    'sqrt'	=> sub { push @stack, sqrt(pop(@stack)) },
    'NUMBER'    => sub { push @stack, $_[0] },
    '_DEFAULT_' => sub { die "Unrecognized token '$_[0]'; aborting" }
};

# The following are add-ons that Dominus discusses; by passing in a
# different dispatch table we can get different results... I suppose
# this is not unlike using flex and bison, and you're just
# frobnicating different "backends" with bison while flex is doing the
# lexing. Lexxing? sp?
my $actions_ast = {
    'NUMBER' => sub {
	push @stack, $_[0]
    },
    '_DEFAULT_'=> sub {
	my $s = pop(@stack);
	push @stack, [ $_[0], pop(@stack), $s ]
    },
};

sub AST_to_string {
    my ($tree) = @_;
    if (ref $tree) {
	my ($op, $a1, $a2) = @$tree;
	my ($s1, $s2) = (AST_to_string($a1), AST_to_string($a2));
	"($s1 $op $s2)";
    } else {
	$tree;
    }
}

my $result = evaluate($ARGV[0], $actions);
print "Result: $result\n";

# and the bonus: print the AST
my $tree_result = evaluate($ARGV[0], $actions_ast);
print "Tree: " . AST_to_string($tree_result), "\n";

sub evaluate {
    my ($expr, $actions) = @_;
    my @tokens = split /\s+/, $expr;
    for my $token (@tokens) {
	#print "looking at token $token\n";
        my $type;
        if ($token =~ /^\d+$/) { # it is a number
            $type = 'NUMBER';
        }
        my $action = $actions->{$type}
	|| $actions->{$token}
	|| $actions->{_DEFAULT_};
	$action->($token, $type, $actions);
    }

    return pop(@stack);
}

__END__

If we wanted to implement exponentiation, would our tab (hash key)
would need to be a reference to a regexp? The regexp has to account
for ^ being a legit token in regular expressions. So: \^(\d+)

The answer is no; we are dealing with postfix notation, so we would
have to implement something like: 2 2 ^, which might translate to "two
to the power of two" or 4 2 ^, "four to the power of two."
