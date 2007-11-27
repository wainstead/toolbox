#!/usr/bin/perl

use strict;
use warnings;
use LWP::UserAgent;
use HTTP::Request;
use URI::Escape;

#my $url = "https://swainstore.myphotodevel.com/tlc-status.php";
#my $url = "https://store.myphotostage.com/tlc-status.php";
my $url = "https://store.myphotoalbum.com/tlc-status.php";


my $formdata = <<"XML";
<Status AffiliateID="PA" OrderID="8077">
		<Shipment PackageID="4000008077" Status="Shipped" ShipDate="2006-08-31 09:34:18">
			<ShipMethod>USPS - First Class</ShipMethod>
			<TrackingNumber></TrackingNumber>
			<Item ItemID="1"/>
		</Shipment>
</Status>
XML

    $formdata = 'xml=' . uri_escape($formdata);

print "Sending:\n$formdata\n";

# build the HTTP Request
my $req = new HTTP::Request(POST => $url);
$req->content_type('application/x-www-form-urlencoded');
$req->content($formdata);

# send the request to the server
my $ua = new LWP::UserAgent;
my $result = $ua->request($req);

# print out the result
if (!defined($result)) {
	print "Error connecting to: $url";
} elsif ($result->is_success()) {
	print "Success!  Got response: \n" . $result->content();
} elsif ($result->is_error) {
	print "Error: " . $result->as_string();
}
print "\n";
