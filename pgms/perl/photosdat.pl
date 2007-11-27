#!/usr/bin/perl -w

use strict;

my $debug = 0;
my $stringre = qr'^s:\d+:"([^"]+)";';
my $objectre = qr'O:\d+:"([^"]+)":\d+:\{';


#my $dat = '/mnt/cel-1/vol01/s/sw/swa/swai/swain/swain/albums/pond/photos.dat';
#my $dat = '/mnt/cel-1/vol01/m/me/meg/megh/megha/meghanspictures/albums/SpiritWeek/photos.dat';

# open PIPE, 'find /mnt/cel-1/vol01/m/me/meg/megh/megha/meghanspictures/albums/ -name photos.dat |'
#     or die "Cannot open pipe  to find photos.dat files: $!\n";



###############
# get usernames

my $command = "mysql -S /tmp/mysql.mpa.sock --silent  -uroot mpa -e 'select username from users u, userstats s where u.userid = s.userid and status > 0 and total_photos > 0 limit 100'";

open PIPE, "$command |" or die $!;

my @users;

# loop on output and build the five levels deep path
while (<PIPE>) {
    chomp;
    #$_ =~ /^(.)(.)(.)(.)(.)/;
    #my $path = "$1/$1$2/$1$2$3/$1$2$3$4/$1$2$3$4$5/$_/albums";
    #push @users, $path;

    push @users,$_;

}
close PIPE;

my $root = '/mnt/cel-1/vol01';
my $x = 0;

# for each five levels deep path, go forth and count
foreach my $subpath (@users) {
    
    if ($x % 100 == 0) {print "$x done\n";}

    $subpath =~ /^(.)(.)(.)(.)(.)/;
    my $path = "$1/$1$2/$1$2$3/$1$2$3$4/$1$2$3$4$5";

    my $userdir = "$root/$path/$subpath/albums";

    opendir DIR, $userdir or do { warn "can't opendir $userdir: $!\n"; next; };
    
    my @contents = grep !/^\./, readdir(DIR); closedir DIR;

ALBUM:
    foreach my $album (@contents) {
        if (-d "$userdir/$album") {
            #&checkFiles("$userdir/$album");
            my $dat = "$userdir/$album/photos.dat";
            my $data = getDat($dat); # read in photos.dat        


            if ( ! defined($data) ) {
                # something is wrong with the file
                print STDERR "Bad dat: $dat\n";
                next ALBUM;
            }

            if ( $data eq 'N;' ) {
                # no photos; empty album
                next ALBUM;
            }

            print $dat if $debug;
            chomp $dat;
            my @galleryfiles = parseDat($data);
            if ( scalar(@galleryfiles) == 0 ) { warn "Got no files: '$dat'\n"; }
            print "in the dat:\n";
            foreach my $file (sort @galleryfiles) {
                print "$file\n";
            }
        }
    }
    $x++;
}


###
### subs
###

sub parseDat {
    my $data = shift;
    $data =~ /^a:(\d\d?\d?):/; # match the number of albumitem objects in the php array
    my $numpix = $1;
    if ($numpix !~ /^\d/) { warn "not an index!: \n$data\n\n"; return;}
    print STDERR "$numpix\n";
    print "$numpix in this album.\n" if $debug;
    
    my @albumitems;

# the loop here matches the pattern "i:$x;", which is the string that
# separates the albumitems in the array in the photos.dat. photos.dat
# is just an array of albumitems; we are going to first discard the
# album string at the beginning, then parse out all the albumitem
# objects. The last one will have an extra '}' at the end, left over
# from the album object definition. It has to be trimmed.

    $data =~ s/\}$//;

    for (my $x = 0; $x <= $numpix; $x++) {
        if ($x == 0) {
            # on first interation, the left hand side of the split contains nothing.
            my (undef, $remainder) = split /i:$x;/, $data, 2;
            $data = $remainder;
            next;
        }

        my ($albumitem, $remainder) = split /i:$x;O:\d+:"albumitem"/, $data, 2;
        #my $leadstring = $1;
        my $leadstring = 'O:1:"albumitem"';
        print "Adding:\n$albumitem\n\n";
        push @albumitems, $albumitem;
        if ($remainder) {
            $data = "$leadstring$remainder"; # fix: split with the O and put it back.
        }
    }

    $::current = '';
    my @galleryfiles;

    for (my $x = 0; $x < $numpix; $x++) {
#    print "$x:  $albumitems[$x]\n\n";
        if ($albumitems[$x] !~ /:"isAlbumName";N;/) {
            print "this is a subalbum.\n" if $debug;
            next;
        }
        $::current = $albumitems[$x];
        print "decomposing object: $::current\n" if $debug;
        my $hashref = decomposeObject($::current);

#    print "--------------------------------------------------------\n";
#    proof($hashref, '');
#     print "and: "  . $hashref->{image}->{name} . "\n";
#     print "and: "  . $hashref->{image}->{type} . "\n";
#     print "and: "  . $hashref->{image}->{resizedName} . "\n";
#     print "and: "  . $hashref->{thumbnail}->{name} . "\n";
#     if (defined($hashref->{highlightImage})) {
#         print "and: "  . $hashref->{highlightImage}->{name} . "\n";
#     }
        #exit;

        my $filename = $hashref->{image}->{name} . "." . $hashref->{image}->{type};
        push @galleryfiles, $filename;
    }
    return @galleryfiles;

} # end parseDat


# getKey will always be called to match a string pattern ($stringre).
# the $::current will then be set to match a value.

sub getKey {

    if ($::current =~ /^\}/) {
        # end of object or array reached
        $::current = $'; #';
        return;
    }
    die "Not passed a proper data string: $::current\n"
        unless ($::current =~ /^s/);
    $::current =~ /$stringre/;
    my $key = $1;
    $::current = $';                  #';
    print "getKey: '$key'\n" if $debug;
    #print "current: '$::current'\n";
    return $key;
}

# match the value, which can be a string, object, array, int, boolean...
# if it's an object or array, recurse.
# will return either a string, or a hash ref if the value was an object or array

sub getValue {

    my $retval = undef;

    # if it's an array or object, recurse..
    if ($::current =~ /^[Oa]/) {
        print "recursion on $&...\n" if $debug;
        return decomposeObject();
    } elsif ($::current =~ /$stringre/) {
        $retval = $1;
        $::current = $';                       #';
        print "getValue: matched string value: '$retval'\n" if $debug;
        #print "current: $::current\n";
        return $retval;
    } elsif ($::current =~ /^i:(\d+);/) {
        $retval = $1;
        $::current = $'; #';
        print "getValue: matched int value: '$retval'\n" if $debug;
        #print "current: $::current\n";
        return $retval;
    } elsif ($::current =~ /^b:\d;/) {
        $retval = $1;
        $::current = $'; #';
        if ( ! defined($retval) ) {
            print "Hmm, matched boolean but it was empty: $::current\n";
        } else {
            print "getValue: matched boolean value: '$retval'\n" if $debug;
        }
        #print "current: $::current\n";
        return $retval;
    } elsif ($::current =~ /N;/) {
        $retval = "N";
        $::current = $'; #';
        print "getValue: matched empty value: '$retval'\n" if $debug;
        #print "current: $::current\n";
        return $retval;
    } else {
        die "got unknown token: $::current\n";
    }

}

# parse objects or arrays

sub decomposeObject {

    return unless $::current;

    my %hash = ();
    my $name = undef;

    if ( $::current =~ /$objectre/o ) {
        $name = $1;
        $::current = $'; #';
    } elsif ($::current =~ /a:\d+:\{/) {
        $name = "array";
        $::current = $'; #';
        if ( $::current =~ /\}/ ) {
            # the array is empty
            $::current = $'; # ';
            return "empty array";
        }
    } else {
        die "Didn't get an array or object: '$::current'\n";
    }

    print "matched object name: '$name'\n" if $debug;
    $::current = $'; #';
    #print "current: $::current\n";

    $hash{'object'} = $name;
    print "paired: 'object' => $hash{'object'}\n" if $debug;

    while ( my $key = getKey() ) {
        $hash{$key} = getValue();
        if ( ! defined($hash{$key}) ) {
            print "no value defined for key '$key'\n";
        } else {
            print "paired: $key => $hash{$key}\n" if $debug;
        }
        if ( defined($hash{'image'}->{'name'}) and 
             defined($hash{'image'}->{'type'}) ) {
            return \%hash;
            
        }
    }
        
    print "object/array '$name' done.\n" if $debug;
    return \%hash;
}

sub proof {
    my $ref = shift;
    my $spacing = shift;
    die "Not passed a ref: $ref\n" unless ref($ref);
    foreach my $key (keys %$ref) {
        if (ref($$ref{$key})) {
            print "$spacing$key:\n";
            proof($$ref{$key}, "$spacing   ");
        } else {
            print "$spacing$key => $$ref{$key}\n";
        }
    }
}

# expects full path to a photos.dat file.
sub getDat {
    my $dat = shift;
    local $/;

    open DATFILE, "< $dat" or die "Can't open '$dat' for reading: $!\n";
    
    my $data = <DATFILE>; close DATFILE;
    
    chomp $data;

    # make sure the file starts with 'N' or 'a', and ends with a '}'

    if ($data eq 'N;') {
        print STDERR "empty array.\n";
        return $data;
    }

    if ( ($data =~ /^a/s) && ($data =~ /\}$/s) ) {
        return $data;
    } 

    # else the file is fucked
    print STDERR "-----------------------------------------\n";
    print STDERR "$data\n";
    print STDERR "-----------------------------------------\n";

    return;
}
