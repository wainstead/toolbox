#!/usr/bin/perl -w

use strict;

use WWW::Mechanize;
use HTML::TokeParser;

my $agent = WWW::Mechanize->new();
$agent->get("http://swain.myphotobuddy.com/setup/shortform.php");

print "shortform: " , $agent->success(), "\n";

$agent->form(1);

$agent->field("editPassword[0]", "secret");
$agent->field("editPassword[1]", "secret");
$agent->field("adminEmail", "swain\@panix.com");
$agent->field("senderEmail", "swain\@panix.com");
$agent->click;

print "after shortform: " , $agent->success(), "\n";

$agent->form(1);
$agent->click;

print $agent->content;
