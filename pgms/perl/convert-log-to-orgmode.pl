#!/usr/bin/env perl

use strict;

# Use the string below as our record separator, even if it is the
# first line of an entry.
$/ = "#########################################################################\n";


my %month_lookup_table = qw(
Jan January
Feb February
Mar March
Apr April
May May
Jun June
Jul July
Aug August
Sep September
Oct October
Nov November
Dec December
);

open LOGGY, "< LOG.txt" or die "Hey ya! $!\n";
open LOGDOTORG, "> LOG.org" or die "Ooga booga: $!\n";

<LOGGY>; # discard the first line of the file, which is just the rec sep

my $counter = 0;
my $N = 10; # N because math history
my $current_month = 'May'; # whence we started working for SSC
my $current_year = '2011'; # see above

while (my $entry = <LOGGY>) {

    my @lines = split("\n", $entry);
    # last line is the separator ($/), do not want
    # pop @lines;

    # If we're just starting out, print the year and month
    if ($counter == 0) {
        print LOGDOTORG "** $current_year\n";
        print LOGDOTORG "*** $current_month\n";
    }
    # first line is the date. We want to convert this line into the
    # org-mode entry line. We also want to parse out the date
    # information for structuring the org-mode file.
    # sample input: '110517 Tue May 17 17:33:40 2011'
    my @datefields = split ' ', $lines[0];

    if ($datefields[5] ne $current_year) {
        print LOGDOTORG "** $datefields[5]\n";
        $current_year = $datefields[5];
    }

    if ($datefields[2] ne $current_month) {
        print LOGDOTORG "*** " , $month_lookup_table{$datefields[2]}, "\n";
        $current_month = $datefields[2];
    }

    $lines[0] = "**** $lines[0]\n";
    print LOGDOTORG $lines[0];

    # escape any blocks of text that were copied from some other
    # org-mode file.
    for my $ln (1..$#lines) {
        $lines[$ln] =~ s/^\*+/-/;
        print LOGDOTORG $lines[$ln], "\n";
    }
    $counter++;
    # only do the first $N entries.
    #exit if $counter > $N;
    
}
