#!/usr/bin/perl

# $Id: createstoreaccount.pl,v 1.1 2006/05/02 16:18:54 swain Exp $

# Failed attempt to create a script to create a new account in the
# store. It fails on the country/state select boxes because they are
# dynamic javascript.

use strict;
use warnings;

use Test::More qw(no_plan);
use Test::WWW::Mechanize;
use Data::Dumper;
use LWP::Debug qw(- debug conns trace); # turns on verbose output.

my ($start_url, $response, $mech);
my $counter = 0;

$start_url = 'https://store.myphotodevel.com/shopping_cart.php';

system('rm trials/*');

$mech = Test::WWW::Mechanize->new();
$mech->agent_alias( 'Windows IE 6' );
$mech->cookie_jar(HTTP::Cookies->new(file => "lwpcookies.txt", autosave => 1));

$response = $mech->get( $start_url ) or die $mech->content;
&basic_check();
$mech->content_like( qr/start here!/, "create account link is present");

$mech->follow_link( text_regex => qr/start here!/ ) or die $mech->content;
&basic_check();
$mech->content_like( qr/First Name:/, "Account creation form is present");

$mech->form_name('create_account');
$mech->select('country', 'US');
$mech->select('state', 'NY');

$mech->submit_form(
                   form_name => 'create_account',
                   fields    => { 
                       firstname =>                     'test account',
                       lastname =>                      'made by mech',
                       email_address =>                 'mechtest@test.myphotodevel.com',
                       street_address =>                '322 8th ave',
                       street_address2 =>               '11th floor',
                       city =>                          'New York',
                       state =>                         'NY',
                       country =>                       'US',
                       postcode =>                      '10001',
                       telephone =>                     '212-981-8635',
                       fax =>                           '',
                       password =>                      '112233',
                       confirmation =>                  '112233'
                       }
                   );

&basic_check();
$mech->content_like( qr/Your new account has been successfully created!/, "Account created");


sub basic_check {
    $counter++;
    $mech->save_content("./trials/$counter.$$.html");
    print "Mech status: ", $mech->status, "\n";
    $mech->content_unlike( qr/Fatal error:/i,  "Page has no 'Fatal error' string");
    $mech->content_unlike( qr/Parse error/i,   "No parse errors");
    $mech->content_unlike( qr/mysql(.*?)error/i, "no Mysql errors");
}
