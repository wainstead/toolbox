#!/usr/bin/env perl

# Find words for the NYT Spelling Bee game

# Bug: the '/usr/share/dict/words' file contains proper nouns that are
# not capitalized, like 'alan'

use strict;
use warnings;

die "You need to pass the required letter" unless $ARGV[0];
die "You need to pass a list of chars" unless $ARGV[1];

open WORDLIST, '< /usr/share/dict/words' or die $!;

my $required_letter = $ARGV[0];
my $chars = $ARGV[1];
my @words; # We'll accumulate matches here

print "required letter: $required_letter\n";
print "chars: $chars\n";

while (my $word = <WORDLIST>) {
    chomp $word;
    next if (length($word) < 4);			# too short
    next if ($word =~ /^[A-Z]/);			# skip proper nouns
    next if ($word =~ /[^$chars$required_letter]/);	# must contain only these letters
    next unless ($word =~ /$required_letter/);		# must contain the required letter
    push @words, $word;
}

# Using the one-line version of 'for' here: "print $_ for @array". You
# have to use the scratch variable to use the one-line syntax.
print "$_\n" for (sort { length($a) <=> length($b) } @words);
