#!/usr/bin/perl

# $Id: upload-flicks.pl,v 1.2 2006/06/05 22:53:16 swain Exp $
# upload lotsa movies

use strict;
use warnings;
use POSIX ":sys_wait_h";

print "Hello, sailor! Need a date?\n";

my (@pids); # this array is our queue

print "I am [$$]\n";

# maintain a queue of $queuesize processes
my $queuesize = 15;
my $iterator  = make_iterator();


for (1..$queuesize) {
    # set up our queue
    my $flick = $iterator->();
    if ($flick) {
        spawn($flick);
    } else {
        $queuesize = $_ - 1;
        print "Set queuesize to $queuesize\n";
        last;
    }
}

while ($queuesize > 0) {

    my ($child, $flick);

    do {
        $child = waitpid(-1,WNOHANG);
    } until $child > 0;

    $queuesize--;

    print "child $child done, exit status $?\n";
    
    if ($flick = $iterator->()) {
        spawn($flick);
        $queuesize++;
    }
}

print "End of line.\n";



sub spawn {
    my $flick = shift;
    die "No flick passed into spawn()\n" unless $flick;
    
    my $pid;

    if ($pid = fork) {
        print "[$$] Parent here, just forked off '$pid' for '$flick'\n";
        return $pid;
    } else {
        print "[$$] Hello, I'm a child with the characters '$flick'.\n";
        print("time ./uploader.pl $flick");
        sleep(5);
        print "\n";
        print "[$$] ($flick) All done!\n";
        exit;
    }
}

sub make_iterator {

    my $path = '/home/swain/Movies';
    my @flicks = (<$path/*.MOV>, <$path/*.mov>, <$path/*.wmv>);
    print "Found ", scalar(@flicks), " movie(s).\n";

    return sub {
        my $flick = pop(@flicks);
        ($flick) ? $flick : undef;
    }
}

