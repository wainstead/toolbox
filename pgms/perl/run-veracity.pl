#!/usr/bin/perl

# $Id: run-veracity.pl,v 1.7 2006/10/23 19:57:07 swain Exp $
# run veracity.php across assorted letters

use strict;
use warnings;
use POSIX ":sys_wait_h";
use lib '/opt/mpa/lib';
require 'db-strict.pl';


print "Hello, sailor! Need a date?\n";

our $maxusers = 200; # set this to the number of users you want to do per Veracity process

my (@pids); # this array is our queue

print "I am [$$]\n";

# maintain a queue of $queuesize processes
my $queuesize = 15;
my $iterator  = make_iterator();

my $initial_queue_size = 0;

for (1..$queuesize) {
    my $arr_ref = $iterator->() or do {
        # for queues smaller that $queuesize, we need to reset $queuesize
        $queuesize = $initial_queue_size;
        last
        };
    # set up our queue
    spawn($arr_ref);
    $initial_queue_size++;
}

print "Queue initialized.\n";

while ($queuesize > 0) {

    my ($child, $arr_ref);

    do {
        $child = waitpid(-1,WNOHANG);
    } until $child > 0;

    $queuesize--;

    print "child $child done, exit status $?\n";
    
    if ($arr_ref = $iterator->()) {

        die "oops!\n" if (!ref($arr_ref));

        spawn($arr_ref);
        $queuesize++;
    }
}

print "End of line.\n";



sub spawn {
    my $arr_ref = shift;
    die "No array ref passed into spawn()\n" unless $arr_ref;
    my ($firstthree, $secondthree) = ($arr_ref->[0], $arr_ref->[1]);
    
    my $pid;

    if ($pid = fork) {
        print "[$$] Parent here, just forked off '$pid' for '$firstthree' thru '$secondthree'\n";
        return $pid;
    } else {
        print "[$$] Hello, I'm a child with the range '$firstthree' thru '$secondthree'.\n";
        system("time ./veracity.php $firstthree $secondthree > /home/www/$firstthree-$secondthree.log");
        print "[$$] ($firstthree thru $secondthree) All done!\n";
        exit;
    }
}


sub make_iterator {


    my $dbh   = &MysqlConnect();

    my $query = "select left(username, 3) as letter, count(left(username, 3)) as cnt from users group by letter";
    #print "$query\n" ;
    my $sth   = $dbh->prepare($query);
    $sth->execute;

    my @stack;
    my @pairs; # this array holds array references, each with two values

    while (my $hash_ref = $sth->fetchrow_hashref) {

        #print "$hash_ref->{letter}, $hash_ref->{cnt}\n";

        # first time through
        unless (@stack) {
            push @stack, $hash_ref;
            next;
        }

        my $sum       = sumstack(@stack);
        my $nextvalue = $sum + $hash_ref->{cnt};

        if ( $nextvalue > $maxusers ) {
            #print "Oops, next value would be $nextvalue ($sum + $hash_ref->{cnt}). Cycling...\n";
            #print "first: $stack[0]->{letter} last: $stack[$#stack]->{letter}\n";
            push @pairs, [ $stack[0]->{letter}, $stack[$#stack]->{letter} ];
            @stack = ();
            push @stack, $hash_ref;
            next;
        }

        push @stack, $hash_ref;
    }

    #print "first: $stack[0]->{letter} last: $stack[$#stack]->{letter}\n";
    push @pairs, [$stack[0]->{letter}, $stack[$#stack]->{letter}];

    $dbh->disconnect;

    # return a reference to an anonymous subroutine (i.e. a closure)
    return sub {
        my $ref = shift @pairs;
        return undef if (!$ref);
        return $ref;
    }
}




# given an array of hash references, return the sum of all values
sub sumstack {
    my $count = 0;
    foreach my $ref (@_) {
        $count += $ref->{cnt};
    }
    return $count;
}

