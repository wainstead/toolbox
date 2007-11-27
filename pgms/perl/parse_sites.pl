#!/usr/bin/perl

# Standalone script to run LiveHTTPHeaders output.

# $Id: parse_sites.pl,v 1.1 2007/03/09 20:29:00 swain Exp $

use Test::More qw(no_plan);
use Test::WWW::Mechanize;
use Data::Dumper;
use LWP::Debug qw(- debug conns trace); # turns on verbose output.
use Getopt::Long;

use strict;
use warnings;

$|++; # unbuffered I/O

# LiveHTTPHeaders puts this separator betwixt each request/response pair.
$/ = '----------------------------------------------------------';



my $ipaddress = '';
my $inputfile = '';
my $result = GetOptions ("ipaddress=s" => \$ipaddress,
                         "file=s" => \$inputfile
                         );


die "Usage: $0 [ --ipaddress <AAA.BBB.CCC.DDD> ]  --file <LHH infile>\n" unless $inputfile;
testAge($inputfile);
open INFILE, "< $inputfile" or die "No such input file '$inputfile': $!\n";

# Set this to a directory where lhhreplay can write the contents of
# each page.
my $trialsdir = '/home/swain/public_html/trials';

unless ( -d "$trialsdir/") {
    die "Can't mkdir trials directory in '$trialsdir'\n" unless mkdir("$trialsdir");
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
$mech->cookie_jar(HTTP::Cookies->new(file => "lwpcookies.txt", autosave => 1));

my $counter = 0;

print "Doing lhh script: ", $inputfile, "\n";

foreach my $hashref (@conversation) {

    # Ignore certain URLs
    next if $hashref->{URL} =~ /google/;


    # break out the hostname; we wanna call by IP address.
    my ($protocol, $host, $getdata);
    if ($hashref->{URL} =~ /\?/) {
        ($host, $getdata) = split /\?/, $hashref->{URL};
    } else {
        $host = $hashref->{URL};
        $getdata = '';
    }

    $host =~ m%(https?://)([^/]+)%;
    $protocol = $1;
    $host     = $2;
    
    #print Dumper($hashref->{HTTPREQUEST});
    my $response;

    # send a Host header file, but request by IP address
    $mech->add_header( Host => $host );

    print "===> going for: ", $hashref->{URL}, "\n";
    print "===> as: $protocol$ipaddress?$getdata\n";


    if ($hashref->{METHOD} eq 'GET') {
        $response = $mech->get( "$protocol$ipaddress?$getdata" );
    } elsif ($hashref->{METHOD} eq 'POST') {
        $response = $mech->post( "$protocol$ipaddress?$getdata", &buildPostData($hashref->{POSTDATA}) );
    }

    ok($mech->success, "returned OK status: " . $mech->status);
    $mech->content_unlike( qr/fatal error/i, "No fatal errors (step $counter)");
    $mech->content_unlike( qr/parse error/i, "No parse errors (step $counter)");
    $mech->content_unlike( qr/mysql error/i, "No mysql errors (step $counter)");
    $mech->content_unlike( qr/out of bounds/i, "No out of bounds errors (step $counter)");
    $mech->content_unlike( qr/Error: No match for E-Mail Address and\/or Password\./i, "No login errors (step $counter)");
    $mech->content_unlike( qr/SQL\/DB Error/i, "No ez_sql errors (step $counter)");
    $mech->content_unlike( qr/Util::dump/i, "No Util::dumps (step $counter)");

    $mech->save_content("$trialsdir/$counter.$$.html");
    $counter++;
    
}




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
