#!/usr/bin/perl

# this is a cron job for my personal crontab; it will commit my
# LOG.txt file once a day.

if ( -e '/Users' ) {
    # this system be osx
    $svnbin = "/usr/bin/svn";
    chdir '/Users/swain/svn'
} else {
    # it be lee-nooks
    $svnbin = "/opt/subversion/bin/svn";
    chdir '/home/swain/svn'
}

$date = scalar(localtime);
system("$svnbin commit -m 'commit for $date' LOG.txt");
