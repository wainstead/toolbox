#!/opt/perl5/bin/perl -w

# $Id: trap.pl,v 1.1 2005/03/22 21:43:24 swain Exp $
# simple example of timing out an operation.

use strict;

$SIG{ALRM} = \&timed_out;

sub timed_out {
    die "FAILED";
}

my $testfile = '/tmp/mpa_login_test';

eval {
    alarm(2);
    open TMPDIR, "> $testfile" or die "FAILED";
    print TMPDIR "test" or die "FAILED";
    close TMPDIR;
    die "FAILED" unless (unlink $testfile);
    alarm(0);
};

if ($@) {
    print "FAILED";
    exit(1);
}
