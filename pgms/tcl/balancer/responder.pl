#!/usr/bin/perl

print "hello sailor!\n";

while (<>) {
    sleep 1;
    chomp;
    next unless $_ =~ /\w/;
    $rev = reverse( join "", split('', $_));
    print "Backwards: $rev\n";
    if (/exit/) {
        print "Exiting.\n";
        exit 0;
    }
}
