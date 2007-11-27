#!/usr/bin/perl

# $Id: waitpids.pl,v 1.2 2006/04/18 14:33:30 swain Exp $
# maintain a queue of N number of children. Use waitpid(-1) to reap them.

use POSIX ":sys_wait_h";

print "I am [$$]\n";

# maintain a queue of $queuesize processes
$queuesize = 5;
# an iterator for our total work
$iterator = make_iterator();

for (1..$queuesize) {
    # set up our queue
    spawn($iterator->());
}

while ($queuesize > 0) {

    do {
        $child = waitpid(-1,WNOHANG);
    } until $child > 0;

    $queuesize--;

    print "child $child done, exit status $?\n";
    
    if ($x = $iterator->()) {
        spawn($x);
        $queuesize++;
    }
}

print "[$$] parent done.\n";


sub spawn { 
    my $x = shift;

    if ($pid = fork) {
        print "[$$] Parent here, just forked off '$pid'\n";
    } else {
        print "[$$] Hello, I'm a child. Sleeping for '$x'\n";
        sleep($x);
        print "[$$] all done sleeping '$x'!\n";
        exit;
    }
}


sub make_iterator {
    my @queue = (3,5,6,2,3,5,1,2,3,1,3,1,4,5,2,3,4,3,1,2,3,4,2,3);
    return sub {
        my $val = shift @queue;
        #push @queue, $val;
        #print "queue now: " . join(",", @queue), "\n";
        return $val;
    }
}
