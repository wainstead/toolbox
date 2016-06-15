#!/usr/bin/env perl

# solve the daily Jumble

# There are words that do not appear in /usr/share/dict/words, if I
# remember correctly, that might appear in the daily Jumble.

die <<"EOLN" unless scalar(@ARGV);
What words do you want to un-jumble?

Usage: $0 word1 [word2, word3,... wordN]
EOLN

open DICTIONARY, '</usr/share/dict/words'
    or die "Can't open dictionary: $!\n";

my %dict;

# Build an asciigram dictionary, such that:
# innoo => onion
while (<DICTIONARY>) {
    chomp;
    # skip captalized words
    /^[A-Z]/ && next;
    # Jumble only uses five or six letter words for the four primary
    # jumbled words.
    next unless 
    $dict{asciigram($_)} = $_;
}

foreach $jumble (@ARGV) {
    if (not checklength($jumble)) {
        die "Not the right length (did you mistype the jumble? '$jumble'\n"
    }
    my $solution = $dict{asciigram($jumble)};
    if (not $solution) {
        $solution = "not found";
    }
    print "$jumble: $solution\n";
}

sub asciigram {
    # Split a word into an  array, sort the array asciibetically, then
    # join that sorted array into a string and return it.
    my $word = shift;
    return join('', sort(split('', $word)))
}

sub checklength {
    # We only deal with words of 5 or 6 chars
    my $candidate = shift;
    return (length($candidate) == 5 or length($candidate) == 6);
}
