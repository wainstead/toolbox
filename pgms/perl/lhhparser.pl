#!/usr/bin/perl

# Faux parser for LiveHTTPHeaders output.

# $Id: lhhparser.pl,v 1.6 2006/02/25 23:28:17 swain Exp $

package LHHParser;

use HTTP::Request;
use Encode qw/encode/;
use Data::Dumper;

use strict;
use warnings;

# LiveHTTPHeaders puts this separator betwixt each request/response pair.
$/ = '----------------------------------------------------------';

die "Usage: $0 <infile>\n" unless $ARGV[0];
open INFILE, "< $ARGV[0]" or die "No such input file '$ARGV[0]': $!\n";

# all request/response pairs will be stored in this array
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
    #$hash{REQUEST}      = &buildRequestObject(\%hash);

    push @conversation, \%hash;
}

# for debugging
print Dumper(@conversation);


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


# returns a new HTTP::Request object

sub buildRequestObject {

    my $hashref = shift;

    my $h = HTTP::Headers->new();

    for my $line ( @{ $hashref->{REQUEST_AREF} } ) {
        next unless $line =~ /:/;
        chomp($line);
        my ($key, $value) = split /: /, $line, 2;
        #print "Adding: '$key' => '$value'\n";
        $h->header($key => $value);
    }

    # build new request to feed to Mech
    my $r = new HTTP::Request($hashref->{METHOD},
                              $hashref->{URL},
                              $h);

    if ( $hashref->{METHOD} eq 'POST' ) {
        # content must be encoded first
        #print "adding post data: " . $hashref->{POSTDATA} . "\n";
        $r->content( encode( 'iso-8859-7', $hashref->{POSTDATA} ) ) ;
    }

    return $r;

}


# I could not find any class or function to do this for me... so...

sub buildPostData ($) {
    my $postdata = shift;
    my @data = split /&|=/, $postdata;    
    map { s/%([A-Fa-f\d]{2})/chr hex $1/eg } @data;
    #for (@data) { print "=> $_\n"; }
    return \@data;
}
