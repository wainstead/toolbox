#!/usr/bin/perl

# $Id: storelogin.pl,v 1.2 2006/02/23 20:49:59 swain Exp $

# This is a demo script that uses the output of LiveHTTPHeaders (the
# Firefox extension, http://livehttpheaders.mozdev.org/) as input. The
# goal is to demonstrate capturing POST data and reusing it with
# Mech. --SW

use strict;
use warnings;

use WWW::Mechanize;
use HTTP::Request;
use Encode qw/encode/;
use Data::Dumper;
use Test::More tests => 4;
use LWP::Debug qw(+trace +debug +conns); # turns on verbose output.

sub showresults { printf " ---> status: %d uri: %s\n", $_[0]->status, $_[0]->uri; }

my $mech = WWW::Mechanize->new();
my $url = 'https://store.myphotostage.com/login.php';
$mech->get( $url );

ok( $mech->status == 200, 'fetch of the login page.');

my $expected_content = "First time shopping with us?";
like( $mech->content(), qr/$expected_content/, "Got expected content ($expected_content)");

$mech->save_content("storeloginphp");
&showresults($mech);

my $h = HTTP::Headers->new();

# parse the LiveHTTPHeaders data, add to our HTTP::Headers instance

while ( my $line = <DATA> ) {
    chomp($line);
    my ($key, $value) = split /: /, $line, 2;
    $h->header($key => $value);
}

# build new request to feed to Mech
my $r = new HTTP::Request('POST',
                          $url,
                          $h);

# for now, hand code the POST data
my $postdata = 'action=login&email_address=swain%40corp.fortunecity.com&new_cust=no&password=112233&x=62&y=9';

# content must be encoded first
$r->content( encode( 'iso-8859-7', $postdata ) ) ;

# print Dumper($r);
# exit;                     

# Mech, being a subclass of LWP::UserAgent, also takes HTTP::Request objects
my $response = $mech->request( $r );

printf "Reponse:\n%s\n", $response->headers_as_string;

# this may in fact not work. I think we see the last status, so we might miss redirects.
ok( $mech->status == 200, "Testing that we did not get redirected while logging in." );

$expected_content = 'Steve Wainstead';
like( $mech->content(), qr/$expected_content/, "Got expected content ($expected_content)" );
&showresults($mech);

$mech->save_content("storelogin.html");

__END__
Host: store.myphotostage.com
User-Agent: Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.7.10) Gecko/20050716 Firefox/1.0.6
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive: 300
Connection: keep-alive
Referer: https://store.myphotostage.com/login.php
Content-Type: application/x-www-form-urlencoded
