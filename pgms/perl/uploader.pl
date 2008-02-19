#!/usr/bin/perl

# Basic file uploader. SW April 2006

use Test::More qw(no_plan); # so it don't complain about a lack of a test plan
use Test::WWW::Mechanize;
use LWP::Debug qw(- debug conns trace); # turns on verbose output.
use Data::Dumper;

die "Usage: $0 <moviefile> <imagefile>\n" unless $ARGV[0] && $ARGV[1];

my $mech = Test::WWW::Mechanize->new();

$mech->cookie_jar(HTTP::Cookies->new(file => "uploader_cookies.txt", autosave => 1));
$mech->agent_alias( 'Linux Mozilla' ); # don't give us the java applet.

print "logging in...\n";

$mech->get( 'http://swain.myphotodevel.com/loginpage.php' );

#printf "login page title: %s\n", $mech->title;
$mech->title_is( 'log in to i got a lust for life' , "got the right page title for login" );
battery_of_tests($mech);

$mech->submit_form(
    form_name      => 'login_form',

    fields         => {
        returnpage      => '/albums.php',
        uname           => 'admin',
        gallerypassword => '112233'
    }

    );



die "Don't appear to be logged in" unless $mech->content_like( qr/Log Out/, "No logout link found" );

#printf "Logged in: %s\n", $mech->title;
$mech->title_is( 'Photo Sharing by MyPhotoAlbum.com : i got a lust for life', "logged in" );
battery_of_tests($mech);

# having logged in, call the movie upload popup directly. Linking to
# the movie upload page is done via javascript on the page, so no dice
# there. No soup for us. Gotta circumvent the application and call it
# directly.

print "fetching movie upload page...\n";
$addmovielink = "http://swain.myphotodevel.com/add_movie.php?set_albumName=album33";
$mech->get($addmovielink);

#printf "Got movie upload form: %s\n", $mech->title;
$mech->title_is( 'Add Video or Movie', "got the movie upload form OK");
battery_of_tests($mech);

$mech->form_name('upload_form');
$mech->field('userfile' => $ARGV[0]);
print "uploading movie...\n";
my $response = $mech->submit();

#print Dumper($response);

#printf "Movie uploaded: %s\n", $mech->title;
$mech->title_is( 'Add Video or Movie', "movie uploaded" );
battery_of_tests($mech);

# now upload una photographia
my $addphotoslink = 'http://swain.myphotodevel.com/add_photos.php?set_albumName=album33';
print "fetching photo upload page...\n";
$mech->get($addphotoslink);

#printf "Got photo upload form: %s\n", $mech->title;
$mech->title_is( 'Add Photos', 'got the photo upload form' );
battery_of_tests($mech);

$mech->form_name('upload_form');
$mech->field('userfile[]' => $ARGV[1]);
print "uploading photo...\n";
$response = $mech->submit();

#printf "Photo uploaded: %s\n", $mech->title;
$mech->title_is( 'Processing and Saving Photos', 'Photo uploaded OK' );
battery_of_tests($mech);

#print Dumper($response);

print "end of line.\n";
exit(0);




# usage: battery_of_tests($mech);
sub battery_of_tests {
    my $mech = shift;


    $mech->content_unlike( qr/fatal error/i, "No fatal errors (step $counter)");
    $mech->content_unlike( qr/parse error/i, "No parse errors (step $counter)");
    $mech->content_unlike( qr/mysql error/i, "No mysql errors (step $counter)");
    $mech->content_unlike( qr/out of bounds/i, "No out of bounds errors (step $counter)");
    $mech->content_unlike( qr/Error: No match for E-Mail Address and\/or Password\./i, "No login errors (step $counter)");
    $mech->content_unlike( qr/SQL\/DB Error/i, "No ez_sql errors (step $counter)");
    $mech->content_unlike( qr/Util::dump/i, "No Util::dumps (step $counter)");
    $mech->content_unlike( qr/Warning:/i, "No PHP warnings (step $counter)");
    $mech->content_unlike( qr/An error has occurred/i, "No 'An error has occurred' (step $counter)");
    $mech->content_unlike( qr/Invalid username or password/i, "No invalid username/password (step $counter)");

}
