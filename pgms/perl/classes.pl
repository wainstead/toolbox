#!/usr/bin/perl

use strict;
use warnings;

require "./config.pl"; # defines $main::configvar

package Foo;

$Foo::blee = 10;

sub new {
    my ($class) = @_;
    my $self = {};
    $self->{hooha} = 1;
    {
        no warnings;
        $self->{mainscope} = $main::configvar;
    }

    bless ($self, $class);
}

sub blippy {
    my $self = shift;
    print "Hello from Foo::blippy\n";
}

sub print_config {
    my $self = shift;
    print "config var is $self->{mainscope}\n";
}

# this is called when a nonexistent sub is called on an instance of
# this class
sub AUTOLOAD {
    our $AUTOLOAD; # magic var that contains the name of the sub called
    print "I was called but I don't exist: $AUTOLOAD\n";
}

# even if you don't declare it, it gets called
sub DESTROY {
    print "Foo destructor called\n";
}

package Kid;
use base qw(Foo);

sub new {
    my ($class) = @_;
    my $self = {};
    $self->{hooha} = 1;

    bless ($self, $class);
}

sub blippy {
    my $self = shift;
    print "Hello from Kid::blippy\n";
}



package main;


my $foo = new Foo();
$foo->blippy;
$foo->nonsuch();
$foo->print_config;

my $kid = new Kid();
$kid->blippy();
$kid->hahaonlyserious();

print $Foo::blee;
#print $Kid::blee; # this won't work
print "\n";
