#!/usr/bin/perl

# $Id: uploader.pl,v 1.4 2006/07/12 20:11:40 swain Exp $

# Basic file uploader. SW April 2006

use WWW::Mechanize;
use LWP::Debug qw(- debug conns trace); # turns on verbose output.
use Data::Dumper;
#use LWP::Debug qw(+  trace debug );

die "Usage: $0 <moviefile>\n" unless $ARGV[0];

my $mech = WWW::Mechanize->new();

$mech->cookie_jar(HTTP::Cookies->new(file => "uploader_cookies.txt", autosave => 1));
$mech->agent_alias( 'Linux Mozilla' ); # don't give us the java applet.

$mech->get( 'http://poopoo.myphotostage.com/loginpage.php' );
$mech->submit_form(
                   form_name => 'login_form',
                   fields => {
                       returnpage => '/albums.php',
                       uname => 'admin',
                       gallerypassword => 'password'
                       }
                   );

#my $response = $mech->follow_link( text_regex => qr/create a new album/i);
#my $addphotoslink = extractLink($mech->content);
#print "Link: $addphotoslink\n";

$addmovielink = "http://poopoo.myphotostage.com/add_movie.php?set_albumName=album01";
$mech->get($addmovielink);
#$mech->get($addphotoslink);

$mech->form_name('upload_form');
$mech->field('userfile' => $ARGV[0]);
$mech->submit();

#print "and: " . $response->header("Location");
#print Dumper($response);
# parse out the album name we got, then...

#$mech->get("http://swain.myphotodevel.com/add_photos.php?set_albumName=$albumname");



$mech->save_content("delme.html");


sub extractLink {
    # looking for a line like:
    # adminOptions.add_photos.value = "http://plookfish.myphotoalbum.com/add_video.php?set_albumName=album22";
    foreach my $line (split /\n/, $_[0]) {
        if ($line =~ /adminOptions.add_video.value = /) {
            my ($key, $val) = split / = /, $line;
            $val =~ s/[";]//g;
            print "returning $val\n";
            return $val;
        }
    }
  }

