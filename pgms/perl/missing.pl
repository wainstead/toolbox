#!/usr/bin/perl -w

# $Id: missing.pl,v 1.1 2005/10/03 20:06:29 swain Exp $

# find all files that have a sized copy on cel-1, but no full size on bob-1.

use strict;

my $command = "";
my $c = 0;
my $cel = '/mnt/cel-1/vol01';
my $bob = '/mnt/bob-1/vol01';

open PIPE, " ./missing.sh | " or die $!;


while (<PIPE>) {
    chomp;
    my @crap = split /\t/;
    $crap[1] =~ m/^(.)(.)(.)(.)(.)/;
    my $subdir = "$1/$1$2/$1$2$3/$1$2$3$4/$1$2$3$4$5";
    my $celdir = "$cel/$subdir/$crap[1]/albums/$crap[2]/$crap[3].sized.$crap[8]";
    my $celfull = "$cel/$subdir/$crap[1]/albums/$crap[2]/$crap[3].$crap[8]";
    my $bobdir = "$bob/$subdir/$crap[1]/albums/$crap[2]/$crap[3].$crap[8]";
    if ( -e $celdir && ! -e $bobdir) {
        if (-e $celfull) { die "holy crap: $celfull\n"; }
        print "cp $celdir $bobdir # ($crap[4])\n";
    }
}


__END__

    0	8344958
    1	bjsphotos
    2	PhotosfromCampChampions2005
    3	DSC02265
    4	2005-08-19 15:00:40
    5	/fx_add_photo.php
    6	559649
    7	67.65.39.5
    8	jpg

# $$Log: missing.pl,v $
# $Revision 1.1  2005/10/03 20:06:29  swain
# $This first version found all files with a sized but no full sized image.
# $
