#!/usr/bin/perl

# $Id: countUnsized.pl,v 1.2 2005/08/22 17:32:03 swain Exp $

# find out how many bytes we'll need to make sized images for all unsized images.
# sw 2005

use strict;
use Math::BigInt;

our $mass = new Math::BigInt(0);

# lazy: just get the usersnames from a pipe. screw dbi.

#my $command = "mysql -S /tmp/mysql.mpa.sock --silent  -uroot mpa -e 'select username from users where status > 0'";

my $command = "mysql -S /tmp/mysql.mpa.sock --silent  -uroot mpa -e 'select username from users u, userstats s where u.userid = s.userid and status > 0 and total_photos > 0 '";

open PIPE, "$command |" or die $!;

my @users;

# loop on output and build the five levels deep path
while (<PIPE>) {
    chomp;
    push @users,$_;
}
close PIPE;

open OUTFILE, "> needsized.out" or die "Can't write needsized.out: $!\n";

my $root = '/mnt/cel-1/vol01';
my $x = 0;

# for each five levels deep path, go forth and count
foreach my $subpath (@users) {

    if ($x % 100 == 0) {print "$x MASS $mass\n";}

    $subpath =~ /^(.)(.)(.)(.)(.)/;
    my $path = "$1/$1$2/$1$2$3/$1$2$3$4/$1$2$3$4$5";

    my $userdir = "$root/$path/$subpath/albums";

    #print "DIR $userdir\n";

    opendir DIR, $userdir or do { warn "can't opendir $userdir: $!\n"; next; };
    
    my @contents = grep !/^\./, readdir(DIR); closedir DIR;
    foreach my $thing (@contents) {
        if (-d "$userdir/$thing") {
            #print "ALBUM $userdir/$thing\n";
            &checkFiles("$userdir/$thing");
        }
    }
    $x++;
}

# and we're done
print "final mass: $mass\n";

# takes a full path to an album directory. figures out if there's no
# sized image and adds size to global $mass.

sub checkFiles {
    my $dir = shift;
    # glob in all the image files
    #my @files = &getImages($dir);
    
    opendir DIR, $dir;
    
    my @files = grep !/\.thumb\.|\.highlight\.|\.dat$|\.dat\.|^\.\.?$/, readdir DIR;

    closedir DIR;

    #print scalar(@files), " files in $dir\n";

    my (%sized, %full);

    # build one hash of sized, one of not, for comparison
    foreach my $file (grep !/\.sized\./, @files) {

        #print "FULL FILE $file\n";

        $full{$file}++;
    }

    foreach my $file (grep /\.sized\./, @files) {

        #print "SIZED FILE $file\n";

        $sized{$file}++;
    }


    # now see if we have a sized, and if not, add it to $mass
    foreach my $key (keys %full) { 

        #print "KEY $key\n";

	(my $copy = $key) =~ s/\.([^.]+)$/.sized.$1/;

        #print "COPY $copy\n";

	if(! defined $sized{$copy}) {

            my $filesize = (stat "$dir/$key")[7];

            $mass += $filesize;
            print OUTFILE "\n$dir/$key";

            #print "NOT FOUND $copy SIZE $filesize MASS $mass\n";
	}
    }
}


