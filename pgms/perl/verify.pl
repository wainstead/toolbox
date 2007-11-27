#!/usr/bin/perl -w

use strict;

use Getopt::Std;
use vars qw(%opts);

getopts( "q", \%opts );

die "usage: $0 <subdomain>\n" unless defined($ARGV[0]);

my $failures = 0;
my $username = $ARGV[0];

my ($a, $b, $c, $d, $e) = split //, $username, 6;

my $disp = "/mnt/cel-1/vol01/$a/$a$b/$a$b$c/$a$b$c$d/$a$b$c$d$e/$username/albums";
my $bob  = "/mnt/bob-1/vol01/$a/$a$b/$a$b$c/$a$b$c$d/$a$b$c$d$e/$username/albums";

###
# prove we provisioned correctly: fast and bob units both have albums directories.

die "No bob dir '$bob'\n" unless (-d $bob);
die "No display dir '$disp'\n" unless (-d $disp);


###
# prove $disp and $bob have the same albums.

my %albums = ();

chdir $disp;

foreach my $album ( <*> ) {
    if (-d $album) {
        print "inserting $disp/$album into the hash...\n" unless (exists($opts{'q'}));
        $albums{$album}++;
    }
}


chdir $bob;

my @albums = ();

for (<*>) {
    if (-d $_) {
        print "pushing $bob/$_ onto the list...\n" unless (exists($opts{'q'}));
        push @albums, $_;
    }
}

if (scalar(@albums) != scalar(keys %albums)) {
    print "The album counts do not match.\n";
    print "display albums:\n", join("\n", sort keys %albums), "\n";
    print "mass storage albums:\n", join("\n", sort @albums), "\n";
    $failures++;
} else {
    print "Album counts match.\n" unless (exists($opts{'q'}));
}

foreach my $album (sort @albums) {
    if (-d $album) {
        print "testing $album...\n" unless (exists($opts{'q'}));
        if ( ! exists($albums{$album}) ) {
            print "No album '$album' in the bob dir.\n";
            $failures++;
        }
    } else {
        print "$album is not an LP.\n";
    }
}

my $numlps = scalar(@albums);
print "$username has the correct album layout. $numlps albums found.\n" unless (exists($opts{'q'}));


###
# prove they contain the right pairing of raw, sized and thumb.


foreach my $album (sort @albums) {

    my @raw = (<$album/*jpg>, <$album/*JPG>);
    unless( scalar(@raw) ) {
        print "bob's $album has no images.\n" unless (exists($opts{'q'}));
        my @sizedorthumb = (<$disp/*jpg>, <$disp/*JPG>);
        if (scalar(@sizedorthumb)) {
            print "      there are display images in '$album' but no raw images.";
            $failures++;
        } else {
            print "disp's $album is also empty.\n" unless (exists($opts{'q'}));;
        }
        next;
    }

    foreach my $rawimage (@raw) {
        #print "$rawimage\n";
        my ($name, $tag) = split /\./, $rawimage;
        my $thumb = "$name.thumb.$tag";
        my $sized = "$name.sized.$tag";
        if ( ! -e "$disp/$thumb" ) {
            print "       No thumbnail '$thumb' for '$rawimage'.\n";
            $failures++;
        }
        if ( ! -e "$disp/$sized" ) {
            my $size =  (stat($rawimage))[7];
            print "       No sized image '$sized' for '$rawimage' ($size bytes)\n";
            $failures++;
        }
    }
    if ($failures > 0 && ! exists($opts{'q'})) {
        print "$failures errors for $album\n";
        exit($failures);
    }
}
