#!/usr/bin/perl -w

use strict;

use WWW::Mechanize;
use HTML::TokeParser;

my $agent = WWW::Mechanize->new();
$agent->get("https://evw-1.ampira.com/cgi-bin/unstick.vps");

my @lines = split /\n/, $agent->content;


print "got: ". scalar(@lines) . "\n";

my $target = "69127";
my $found = 0;

CHECKFORMAILID:
foreach my $line (@lines) {
    if ( $line =~ m/>(\d+)</ ) {
        my $mailid = $1;
        print "Matched mailid $mailid\n";
        if ($mailid eq $target) {
            print "We have a winner: $mailid\n";
            $found = 1;
            last CHECKFORMAILID;
        }
    }
}

if ($found == 0) {
    print "HOLY CRAP ON A STICK NO MAIL ID FOUND THE WORLD IS ENDING\n";
} else {
    print "whoopee, yay. found it. *yawn*\n";
}



print "\ndone\n";
