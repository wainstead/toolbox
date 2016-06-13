#!/usr/bin/env perl

# solve the daily Jumble

open DICTIONARY, '</usr/share/dict/words'
    or die "Can't open dictionary: $!\n";
while (<DICTIONARY>) {
    chomp;
    /^[A-Z]/ && next;
    next unless (length($_) == 5 or length($_) == 6);
    $dict{myfunc($_)} = $_;
}

foreach $word (keys %dict) {
    print "$word, $dict{$word}\n";
    last;
}

print $dict{myfunc($ARGV[0])}, "\n";

sub myfunc {
    my $word = shift;
    return join('', sort(split('', $word)))
}
