#!/opt/perl5/bin/perl -w

# examine a Gallery site for borkness, horked things, fubar'd qualities, etc.
# $Id: mpa-diagnose.pl,v 1.4 2004/09/15 15:39:02 swain Exp $

die &usage() unless ( $ARGV[0] ) ;

use strict;
use File::MMagic;
use FileHandle;
use File::Find;
use Getopt::Std;
use vars qw(%opts);

getopts( "d:p:h", \%opts );

die &usage() if defined($opts{'h'});

use vars qw( $path $file $type $size $date $fqdn @searchpath @dirs);
sub wanted; # defined at end of this file

$path = "";

@dirs = qw( albums );

if ( defined($opts{'d'}) ) {
    $fqdn = $opts{'d'};
} elsif ( defined($ARGV[0]) ) {
    $fqdn = $ARGV[0];
    if ($fqdn !~ /.myphotoalbum.com$/) {
       $fqdn .= ".myphotoalbum.com";
    }
} elsif ( defined($opts{'p'}) ) {
    $path = $opts{'p'};
    if ( ! -e $path ) {
       die "The path you gave me does not exist ('$path').\nPerhaps the account was delete?\n";
    }
} else {
    die "usage: $0 subdomain or $0 -d fqdn\n"; 
}

# if the user supplied a path, then we don't need the searchpath; and
# when @searchpath is empty, the for loop below will not be run (which
# is what we want to happen).

unless ($path) {
    @searchpath = qw(
    /opt/evw/scripts/ampira/provisioners/gallery/archive
    /opt/evw/scripts/ampira/provisioners/gallery/done
    /home/swain/archive
    );
}

FINDTREE:
foreach my $searchdir (@searchpath) {
    if ( -e "$searchdir/$fqdn" ) {
        print "Original install email:  $searchdir/$fqdn\n";

        open EMAIL, "$searchdir/$fqdn" 
            or die "Cannot open $searchdir/$fqdn to find the site's directory: $!\n";
        while (my $line = <EMAIL>) {
            if ($line =~ /^(Filesystem:: )/) {
                chomp $line;
                (undef, $path) = split /:: /, $line;
                $path =~ s|//|/|g;
                print "Site directory: $path\n";
            }

            if ($line =~ /^shortform:: /) {
                my (undef, $shortform) = split /:: /, $line;
                print "URL to shortform: $shortform\n";
            }

            if ($line =~ /^username::/) { print "username: " . $'; } #';
            if ($line =~ /^password::/) { print "password: " . $'; } #';

        }
    }
}

die "Can't find ${fqdn}'s installation email.\n" unless ($path); 

unless ( chdir $path ) {
    print "This user was probably deleted, since the home directory is gone.\n";
    exit;
}
        

#my $mm = File::MMagic->new('/usr/share/file/magic'); # use internal magic file
my $mm = new File::MMagic; # default magic file

# first, test the config.php file.

$file = "config.php";
my $fullpath = "$path/config.php";
$type = $mm->checktype_filename( $fullpath );
my @stats = stat( $fullpath );
$size = (stat( $fullpath ))[7];
$date = scalar(localtime($stats[9]));
write;

unless ( -e "$path/albums" ) {
    print "No album directory for $fqdn.\n";
} else {
    # Traverse desired filesystems; the 'wanted' sub writes out to STDOUT.
    File::Find::find({wanted => \&wanted}, @dirs);
}

# end main loop

format STDOUT_TOP = 

Filename                                          Type    Size                   Last Modified
----------------------------------------------------------------------------------------------
.

# define the format to write the report to STDOUT
format STDOUT =
@<<<<<<<<<<<<<<<<<<<<<<<<<<<<< @>>>>>>>>>>>>>>>>>>>>>>> @>>>>>> @>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
$file, $type, $size, $date
.


# the sub used by Find::File as a callback on every file found
sub wanted { 
    #print "Testing: $File::Find::name...\n";
    return unless ($_ =~ /jpe?g$|gif$|dat??|bak$/i);
    return if ($_ =~ /lock$/);

    $type = $mm->checktype_filename( $_ ); # .  $Find::File::name );
    my @stats = stat($_);
    $size = $stats[7];
    $date = scalar(localtime($stats[9]));
    $file = $_;
    write;
}

sub usage {
    return <<"    EOLN";
  Usage: $0 subdomain
      or $0 -d example.com (no 'www')
      or $0 -p /path/to/user/web/site

      Check that config.php is a text file, all images are images, etc. One
      dead giveaway is if a file is 'application/octet-stream'. This should not be.

    EOLN
        ;
}

# $Log: mpa-diagnose.pl,v $
# Revision 1.4  2004/09/15 15:39:02  swain
# updated usage message.
#
# Revision 1.3  2004/09/15 14:58:30  swain
# Added two new features: takes optional arguments...
#
# -d for a domain name
# -p for a path to the users's site
#
# This handles the case of a paid domain name (example.com), and the
# case where we don't have the install email anymore.
#
# Revision 1.2  2004/09/13 21:31:38  swain
# Rearranged the code
#
# Revision 1.1  2004/09/13 21:15:16  swain
# First working version.
#
