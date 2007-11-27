#!/usr/bin/perl

@files = <*.m4a>;

foreach $file (@files) {
    next if $file =~ /^01/;
    next if $file =~ /^02/;

    print "# before: $file\n";
    $copy = $file;
    $copy =~ s/^(\d\d) /$1_/;

    print "# after:  $copy\n";
    print "scp '$file' slim.deasil.com:public_html/mp3/wan/$copy\n";
}
