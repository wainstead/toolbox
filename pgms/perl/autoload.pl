#!/usr/bin/perl

# testbed for the supremely lazy: getters and setters via AUTOLOAD.

use strict;
use warnings;


package QualexXMLDocument;

use vars '$AUTOLOAD';

sub new {
    my ($class) = @_;
    my $self = {};
    
    bless ($self, $class);
}


sub AUTOLOAD {
    my ($self, $newval) = @_;
    $AUTOLOAD =~ m/.*::get_(\w+)_nodes/
        and do { print "matched '$1' for get nodes\n"; return; };
    $AUTOLOAD =~ m/.*::get_(\w+)_node/
        and do { print "matched '$1' for get single node\n"; return; };

    $AUTOLOAD =~ m/.*::set_(\w+)_node/
        and do { print "setting '$1' to '$newval' in  set node\n"; return; };

    die "No such method: $AUTOLOAD\n";
}


sub DESTROY {}

package main;

my $qxd = QualexXMLDocument->new();

$qxd->get_product_nodes();
$qxd->get_address_node();
$qxd->set_firstname_node("blippy");
$qxd->set_lastname_node("finkelstein");
$qxd->to_string();
