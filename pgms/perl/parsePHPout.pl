#!/usr/bin/perl

# $Id: parsePHPout.pl,v 1.3 2006/05/23 14:17:19 swain Exp $

# Using two subs, separate all HTML from PHP code from a given file.

use strict;
use warnings;

chdir '/home/swain/public_html/projects/ampiradev/gallery';

my $file;

READFILE: {
    undef $/;
    open INFILE, "albums.php" or die $!;
    $file = <INFILE>;
}

print length($file), " chars long\n";

my $counter = 10000;
my %php = ();
my %html = ();

my @parts = &parse_start($file);

sub parse_start {
    my $code = shift;
    $code =~ /<\?/ or do { $html{ ++$counter } = $code; return; };
    my $chunk = $`;
    $html{ ++$counter } = $chunk;
    my $remainder = $& . $';        #';
    &parse_to_end($remainder);
}

sub parse_to_end {
    my $code = shift;
    $code =~ /\?>/ or return do { $html{ ++ $counter } = $code; return; };

    my $chunk = $` . $&;
    $php{ ++$counter } = $chunk;
    my $remainder = $';            #';
    &parse_start($remainder);
}

print "array size: ", scalar(@parts), "\n";
print "total chars: ", length(join '', (values(%html), values(%php))), "\n";

open OUTFILE, ">delme.php" or die $!;

foreach my $key (sort (keys %html, keys %php) ) {
    if (exists($html{$key})) {
        print OUTFILE $html{$key};
    } elsif (exists($php{$key})) {
        print OUTFILE $php{$key};
    } else {
        die "How did I get here?\n";
    }
}


#print OUTFILE join '', @parts;


# $Log: parsePHPout.pl,v $
# Revision 1.3  2006/05/23 14:17:19  swain
# backing up before bork bellies up
#
# Revision 1.2  2006/01/17 21:38:41  swain
# Newer, better: HTML and PHP are sorted into hashes, keyed on a counter
# that starts at 10000 so we can use sort() to restore things to
# order. Testing this I see:
#
# [prs-1 perl]$ ./parsePHPout.pl
# 30517 chars long
# Deep recursion on subroutine "main::parse_start" at ./parsePHPout.pl line 44, <INFILE> chunk 1.
# Deep recursion on subroutine "main::parse_to_end" at ./parsePHPout.pl line 34, <INFILE> chunk 1.
# total chars: 30517
# [prs-1 perl]$ cd ~swain/public_html/projects/ampiradev/gallery
# [prs-1 gallery]$ ls -l albums.php delme.php
# -rw-r--r--  1 swain swain 30517 Jan 17 15:04 albums.php
# -rw-r--r--  1 swain swain 30517 Jan 17 16:36 delme.php
# [prs-1 gallery]$ diff albums.php delme.php
# [prs-1 gallery]$
#
# Revision 1.1  2006/01/17 21:23:28  swain
# Simple parser to separate all HTML and PHP into an array.
#
