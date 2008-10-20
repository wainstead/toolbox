#!/usr/bin/perl

# this is a cron job for my personal crontab; it will add any new
# shellbuffer files not currently in SVN, and then commit everything
# with a timestamp.

$svnbin = "/opt/subversion/bin/svn";

chdir '/home/swain/.emacs.shellbuffers';

open PIPE, "$svnbin stat | " or die "Couldn't open pipe to svn: $!\n";
while (<PIPE>) {
    chomp;

    # we are looking for lines like:
    # ?      swainstore osc log
    # ?      swainstore apache error2 log
    next unless /^\?/; # new files are on lines prefaced with a question mark //;

    $_ =~ s/^\? +//; # strip leading ? and spaces
    print "got: '$_'\n";
    system("$svnbin add '$_'");
}

$date = scalar(localtime);
system("$svnbin commit -m 'commit for $date'");
