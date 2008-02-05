#!/usr/bin/perl

# lhhreplay.pl: A standalone script to run LiveHTTPHeaders output.
# http://sourceforge.net/projects/lhhreplay

# I wrote lhhreplay.pl to "replay" scripts I made in LiveHTTPHeaders,
# the Firefox add-on (http://livehttpheaders.mozdev.org/). The goal
# was to be able to do high level web application testing, and to be
# able to cross from any site to any other site (in my case, from a
# site using HTTP to one that uses HTTPS and back again; and to repeat
# all the AJAX traffic as well).

# To use this script: open LiveHTTPHeaders, perform some end to end
# task with your web application, and save the resulting script (I
# always use the extension .lhh when I save them). With that script
# (let's say you named it "myscript.lhh") do:

# ./lhhreplay.pl myscript.lhh

# and if all goes well lhhreplay.pl will repeat the exact same
# thing. If there are failures, Perl's testing harness will tell you
# how many failures there were. You can scroll back in the output to
# find them.

# This is a very tricky approach to testing, however. If you have
# Gmail open in another tab your test will contain lots of calls to
# Google; likewise, I find RSS requests from Firefox mixed in. You can
# simply filter these out in this script down by the comment "Ignore
# certain URLs."

# Also, if you have GET variables that change with each run -- for
# example, you make a purchase and the order ID is in the URL -- you
# might get unexpected results. You can either customize this script
# to accomodate it or change your app to be easier to test.

# I've found that, after about a week, the input scripts I make with
# LiveHTTPHeaders tend to "go stale." It's best to periodically
# recreate whole new tests; this only takes me a few minutes so it's
# no big deal. I put in a warning to tell you when you are running a
# test that's over a week old.

# One tip I have is to turn off images in LiveHTTPHeaders (click on
# the "Config" tab in LHH, and you'll see what I mean). Otherwise your
# test will check for every single image file (which might be what you
# want, but while I'm developing, it's just too much noise).

# Finally, your own app may surprise you sometimes. One day my app was
# returning blank pages and my test was not showing this, and it was
# an hour or so before I even realized this! (This is now covered by
# lhhreplay.pl; blank pages are considered an error).

# This script saves the full contents of every page returned in the
# directory $trialsdir. This is a convenience for you; if one of the
# steps fails, you can open the page in your browser to see what the
# error was.

# Finally, one of the neat things about this script is you can run it
# in the Perl debugger and step through your web app.

# lhhreplay.pl has allowed me to do a huge amount of refactoring of a
# code base that started as OSCommerce (if you have any familiarity
# with it, you know what a huge challenge that would be) with a very
# high degree of confidence that my changes did not introduce new
# bugs.

# Author: Steve Wainstead, 2007, swain AT panix DOT com
# http://sourceforge.net/projects/lhhreplay

# Feel free to send feature requests, patches, suggestions, or flames
# to swain AT panix DOT com.


use Test::More qw(no_plan);
use Test::WWW::Mechanize;
use Data::Dumper;
use LWP::Debug qw(- debug conns trace); # turns on verbose output.

use strict;
use warnings;

$|++; # unbuffered I/O

# LiveHTTPHeaders puts this separator betwixt each request/response pair.
$/ = '----------------------------------------------------------';


die "Usage: $0 <LHH infile>\n" unless $ARGV[0];
testAge($ARGV[0]);
open INFILE, "< $ARGV[0]" or die "No such input file '$ARGV[0]': $!\n";


# Set this to a directory where lhhreplay can write the contents of
# each page.
my $trialsdir = '/home/swain/public_html/trials';

unless ( -d "$trialsdir/") {
    unless (mkdir("$trialsdir")) {
        print "Can't mkdir trials directory: '$trialsdir'\n";
        print '(Did you set the value of $trialsdir in the script?', "\n";
        exit(1);
    }
}

# clear any previous trial's files
system("rm -f $trialsdir/*");

# all request/response pairs from the input script will be stored in
# this array
my @conversation = ();


while (my $chunk = <INFILE>) {

    $chunk =~ s/\r//gm; # HTTP exchanges delimit lines with \r\n

    my ($request, $response) = split /^HTTP/m, $chunk, 2;

    next unless $request =~ /\w/; # skip uninteresting records.
    die "Got request but no response: $request $response\n"
        if ($request && !$response);

    my (%hash);

    my ($URL, $request_ar) = &extractURL($request);

    die "No url.\n"     unless $URL;
    die "No request.\n" unless $request_ar;

    # build our hash, which will be placed in the @conversation array

    $hash{URL}          = $URL;
    $hash{REQUEST_AREF} = $request_ar;
    $hash{METHOD}       = &extractMethod( $request_ar->[0] );

    if ( $hash{METHOD} eq 'POST' ) { $hash{POSTDATA} = &extractPOST($request_ar); }

    $hash{RESPONSE_TXT} = $response;

    push @conversation, \%hash;
}

# We now have the whole LHH script stored in
# @conversation. Instantiate a new copy of Test::WWW::Mechanize and
# iterate over @conversation.

my $mech = Test::WWW::Mechanize->new();
$mech->agent_alias( 'Windows IE 6' ); # see the perldoc for WWW::Mechanize 
                                      # on setting useragent strings

# Warning: if your test logs you in, the next run of the test might
# find you still logged in. Starting a new cookie jar usually solves
# this. I always log out at the end of the test.

$mech->cookie_jar(HTTP::Cookies->new(file => "lwpcookies.txt", autosave => 1));

my $counter = 0;

print "Starting at ", scalar(localtime()), "\n";
print "Doing lhh script: ", $ARGV[0], "\n";

foreach my $hashref (@conversation) {

    # Ignore certain URLs

    next if $hashref->{URL} =~ /google/;
    next if $hashref->{URL} =~ /mozilla/;
    next if $hashref->{URL} =~ /hitslink/;
    next unless $hashref->{URL} =~ /myphoto/;


    print "going for: ", $hashref->{URL}, "\n";
    #print Dumper($hashref->{HTTPREQUEST});
    my $response;

    if ($hashref->{METHOD} eq 'GET') {
        $response = $mech->get( $hashref->{URL} );
    } elsif ($hashref->{METHOD} eq 'POST') {
        $response = $mech->post( $hashref->{URL}, &buildPostData($hashref->{POSTDATA}) );
    }


    ###
    ### Customize these rules to your application.
    ###

    my $errcount = 0;

    $errcount++ unless ok($mech->success, "returned OK status: " . $mech->status . "  (step $counter)");

    # ajax calls sometimes return nothing. i s'pose they should at least return Booleans.
    if ( $hashref->{URL} !~ /ajax/) {   
        $errcount++ unless ok($mech->content, "Server returned some text (step $counter)");
    }


    $errcount++ unless $mech->content_unlike( qr/fatal error/i, "No fatal errors (step $counter)");
    $errcount++ unless $mech->content_unlike( qr/parse error/i, "No parse errors (step $counter)");
    $errcount++ unless $mech->content_unlike( qr/mysql error/i, "No mysql errors (step $counter)");
    $errcount++ unless $mech->content_unlike( qr/out of bounds/i, "No out of bounds errors (step $counter)");
    $errcount++ unless $mech->content_unlike( qr/Error: No match for E-Mail Address and\/or Password\./i, "No login errors (step $counter)");
    $errcount++ unless $mech->content_unlike( qr/SQL\/DB Error/i, "No ez_sql errors (step $counter)");
    $errcount++ unless $mech->content_unlike( qr/Util::dump/i, "No Util::dumps (step $counter)");
    $errcount++ unless $mech->content_unlike( qr/Warning:/i, "No PHP warnings (step $counter)");
    $errcount++ unless $mech->content_unlike( qr/An error has occurred/i, "No 'An error has occurred' (step $counter)");
    $errcount++ unless $mech->content_unlike( qr/Invalid username or password/i, "No invalid username/password (step $counter)");

    my $errstr = "";
    $errstr = "error" if ($errcount);
   
    $mech->save_content("$trialsdir/$counter.$$.$errstr.html");

    $counter++;
    
}

print "Finished at ", scalar(localtime()), "\n";


# separate the URL from the response headers

sub extractURL {
    my $request = shift;

    my @lines = grep { /\w/} split /\n/, $request;
    my $URL = shift @lines;

    return ($URL, \@lines);
}


# get the method (GET, POST, etc)

sub extractMethod { return ( split / /, $_[0] )[0]; }


# get the POST data

sub extractPOST {
    my @array = @{$_[0]};
    return $array[$#array];    
}


# I could not find any class or function to do this for me... so...
sub buildPostData ($) {
    my $postdata = shift;
    $postdata =~ s/\+/ /g;
    my @data = split /&|=/, $postdata;    
    map { s/%([A-Fa-f\d]{2})/chr hex $1/eg } @data;
    #for (@data) { print "=> $_\n"; }
    return \@data;
}

sub testAge {
    my @stat = stat($_[0]);
    my $now = time;
    my $weekago = 60 * 60 * 24 * 7;
    if ( ($now - $stat[9]) > $weekago ) {
        warn("WARNING: $_[0] is over a week old.\n");
        warn("You might want to create a new test, or:\n");
        warn("/bin/touch $_[0]\n");
        warn("to make this message go away until next week.\n");
        warn("Hit RETURN to continue:\n");
        my $return = getc();
    }
}
