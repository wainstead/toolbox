#!/usr/bin/perl -w

# $Id: fork.pl,v 1.2 2005/06/15 21:34:57 swain Exp $

use strict;

print "Hello, sailor!\n";

my ($pid, $char, @pids);

print "I am $$\n";

foreach $char ('0'..'9', 'a'..'z') {

    if ($pid = fork) {
        print "$$ Parent here, just forked off '$pid'\n";
        push @pids, $pid;
    } else {
        print "$$ Hello, I'm a child with the character '$char'.\n";
        system("./getposts.pl $char");
        print "$$ ($char) good bye!\n";
        exit;
    }
}

foreach my $cpid (@pids) {
    waitpid($cpid,0);
}

print "End of line.\n";

# $Log: fork.pl,v $
# Revision 1.2  2005/06/15 21:34:57  swain
# This version calls getposts.pl with a single argument; forking for a-z
# and 0-9 to give us cheap parallelism.
#
# Revision 1.1  2005/06/15 15:36:21  swain
# Demo on forking from 0-9 and a-z, with an eye towards a script that
# will measure all the blogs in parallel.
#
# Revision 1.1  2005/06/08 13:18:59  swain
# Dead end script attempting to send to the command channel while
# sending on the data channel. But I have a simpler idea...
#
