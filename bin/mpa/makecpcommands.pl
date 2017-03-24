#!/usr/bin/perl

die "Usage: $0 [project]. Example: $0 products\n" unless $ARGV[0];

$project = 'mpa_' . $ARGV[0];

while ($file = <STDIN>) {
    chomp $file;
    print "cp $project/$file ${project}_prod/$file ; ";
}
