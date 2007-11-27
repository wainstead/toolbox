#!/usr/bin/perl

use SQL::ReservedWords::MySQL;

while (my $line = <STDIN>) {
    $line =~ m/^(\s*)(.*?)(\s*)$/;
    my ($leading_whitespace, $code, $trailing_whitespace) = ($1, $2, $3);
    my @words = split / +/, $code;

    for ($x = 0; $x < $#words; $x++) {
        if (SQL::ReservedWords::MySQL->is_reserved($words[$x])) {
            $words[$x] = uc($words[$x]);
        }
    }

    print $leading_whitespace, join(' ', @words), $trailing_whitespace;
}

# $Id: sqltidy.pl,v 1.1 2006/08/14 19:06:13 swain Exp $
