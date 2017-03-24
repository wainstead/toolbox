#!/usr/bin/perl

use lib "$ENV{'HOME'}/svn/lib";
require "swainlib.pl";

foreach $line (get_current_production_tags() ) {
    print $line;
}


