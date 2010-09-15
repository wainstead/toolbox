#!/usr/bin/perl

use lib "$ENV{'HOME'}/svn/lib";
require "swainlib.pl";

my @tags = get_current_production_tags();

foreach $line (@tags) {
    chomp $line;
    ($project, $tag) = split /: +/, $line;
    next if $tag eq 'trunk';
    print "cd /home/swain/public_html/projects/${project}_prod; svn switch https://svn.myphotoalbum.com/$project/tags/$tag; ";
}

print "\n";

