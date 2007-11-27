#!/usr/bin/perl

# $Id: run-rsyncs.pl,v 1.1 2006/10/14 03:10:24 swain Exp $
# run a bunch of rsyncs for christoff von ferry

use strict;
use warnings;
use POSIX ":sys_wait_h";

my $inputfile = $ARGV[0] or die "Usage: $0 <inputfile>\n";
print "Hello, sailor! Need a date?\n";

my (@pids); # this array is our queue

print "I am the parent: [$$]\n";

# maintain a queue of $queuesize processes
my $queuesize = 10;
my $iterator  = make_iterator($inputfile);


for (1..$queuesize) {
    # set up our queue
    spawn($iterator->());
}

while ($queuesize > 0) {

    my ($child, $nextline);

    do {
        $child = waitpid(-1,WNOHANG);
    } until $child > 0;

    $queuesize--;

    print "child $child done, exit status $?\n";
    
    if ($nextline = $iterator->()) {
        spawn($nextline);
        $queuesize++;
    }
}

print "End of line.\n";



sub spawn {
    my $nextline = shift;
    die "No chars passed into spawn()\n" unless $nextline;
    
    my $pid;

    if ($pid = fork) {
        print "[$$] Parent here, just forked off '$pid' for '$nextline'\n";
        return $pid;
    } else {
        print "[$$] Hello, I'm a child with the characters '$nextline'.\n";

        # this is your system command that this script maintains
        #system("time ./veracity.php $nextline > /home/www/$nextline.log");
        print system("echo $nextline");

        print "[$$] ($nextline) All done!\n";
        exit;
    }
}

sub make_iterator {

    my ($inputfile) = @_; # pass this function a filename
    die "No such file: '$inputfile'" unless -e $inputfile;
    open RSYNCLIST, "< $inputfile" or die "Cannot open '$inputfile': $!\n";
    my @lines = <RSYNCLIST>; # read in all the lines
    
    return sub {

        if (my $nextline = pop @lines) {
            chomp $nextline;
            return $nextline;
        }

        # else our queue is exhausted
        return undef;
    }
}

