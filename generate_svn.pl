#!/usr/bin/perl

# copies trunk to tags/STAGING for all projects, using Perl's magic `` HERE doc notation.
# Probably not flexible enough for the long haul but enough to satisfy my laziness for now.

@projects = qw(gallery cart products);

for (@projects) {
    print <<`EOLN`;
    svn delete -m "prepping for release" https://svn.corp.myphotoalbum.com/mpa_$_/tags/STAGING;
    svn copy -m "trunk to STAGING release for testing" https://svn.corp.myphotoalbum.com/mpa_$_/trunk https://svn.corp.myphotoalbum.com/mpa_$_/tags/STAGING;
EOLN
}
