#!/usr/bin/perl

open DICT, "< /usr/share/dict/linux.words" or die $!;

while (<DICT>) {
    $count++;
    chomp;
    next if /[^abcdef]/i;
    print "$_\n";
    #last if $x++ > 25;
}

print "saw $count words.\n";
