#!/usr/bin/perl


require "config.pl";
loadconfig('main');


print "I am in main: ", $main::configvar, ".\n";
