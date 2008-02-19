#!/usr/bin/perl

# $Id: uploader.pl,v 1.4 2006/07/12 20:11:40 swain Exp $

# Basic file uploader. SW April 2006

use Test::More qw(no_plan); # so it don't complain about a lack of a test plan
use Test::WWW::Mechanize;
use LWP::Debug qw(- debug conns trace); # turns on verbose output.
use Data::Dumper;
#use LWP::Debug qw(+  trace debug );

die "Usage: $0 <moviefile>\n" unless $ARGV[0];

my $mech = Test::WWW::Mechanize->new();

$mech->cookie_jar(HTTP::Cookies->new(file => "uploader_cookies.txt", autosave => 1));
$mech->agent_alias( 'Linux Mozilla' ); # don't give us the java applet.

$mech->get( 'http://swain.myphotodevel.com/loginpage.php' );
$mech->submit_form(
    form_name      => 'login_form',

    fields         => {
        returnpage      => '/albums.php',
        uname           => 'admin',
        gallerypassword => '112233'
    }

    );


#dumpfileandexit($mech->content);

die "Don't appear to be logged in" unless $mech->content_like( qr/Log Out/, "No logout link found" );

#my $response = $mech->follow_link( text_regex => qr/create a new album/i);
#my $addphotoslink = extractLink($mech->content);
#print "Link: $addphotoslink\n";

# having logged in, call the movie upload popup directly. It's done
# via javascript on the page, so no dice there. No soup for us.

$addmovielink = "http://swain.myphotodevel.com/add_movie.php?set_albumName=album33";
$mech->get($addmovielink);
#$mech->get($addphotoslink);
print $mech->content;
$mech->form_name('upload_form');
$mech->field('userfile' => $ARGV[0]);
my $response = $mech->submit();

print "and: " . $response->header("Location");
print Dumper($response);


# now upload una photographia
# http://swain.myphotodevel.com/add_photos.php?set_albumName=album33
my $addphotoslink = 'http://swain.myphotodevel.com/add_photos.php?set_albumName=album33';
$mech->get($addphotoslink);
$mech->form_name('upload_form');
$mech->field('userfile[]' => $ARGV[1]);
$response = $mech->submit();

print "and: " . $response->header("Location");
print Dumper($response);

# parse out the album name we got, then...


sub extractLink {
    # looking for a line like:
    # adminOptions.add_photos.value = "http://plookfish.myphotoalbum.com/add_video.php?set_albumName=album22";
    foreach my $line (split /\n/, $_[0]) {
        if ($line =~ /adminOptions.add_video.value = /) {
            my ($key, $val) = split / = /, $line;
            $val =~ s/[";]//g; #";
            print "returning $val\n";
            return $val;
        }
    }
  }

sub dumpfileandexit {
    my $mech = shift;
    open OUTFILE, "> delme.html" or die $!;
    print OUTFILE $mech->content;
    exit;
}
