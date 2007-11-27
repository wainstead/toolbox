#!/usr/bin/perl

# $Id: periodicity.pl,v 1.3 2006/10/23 19:06:05 swain Exp $



use strict;
use warnings;

use lib '/opt/mpa/lib';
require 'db-strict.pl';

our $maxusers = 200; # set this to the number of users you want to do per Veracity process

my $iterator = make_iterator();

print "here we go: \n";
while (my $arr_ref = $iterator->()) {
    print "$arr_ref->[0], $arr_ref->[1]\n";
}


sub make_iterator {


    my $dbh   = &MysqlConnect();

    my $query = "select left(username, 3) as letter, count(left(username, 3)) as cnt from users group by letter";
    #print "$query\n" ;
    my $sth = $dbh->prepare($query);
    $sth->execute;

    my @stack;
    my @pairs;

    while (my $hash_ref = $sth->fetchrow_hashref) {

        #print "$hash_ref->{letter}, $hash_ref->{cnt}\n";

        # first time through
        unless (@stack) {
            push @stack, $hash_ref;
            next;
        }

        my $sum = sumstack(@stack);
        my $nextvalue = $sum + $hash_ref->{cnt};

        if ( $nextvalue > $maxusers ) {
            #print "Oops, next value would be $nextvalue ($sum + $hash_ref->{cnt}). Cycling...\n";
            #print "first: $stack[0]->{letter} last: $stack[$#stack]->{letter}\n";
            push @pairs, [$stack[0]->{letter}, $stack[$#stack]->{letter}];
            @stack = ();
            push @stack, $hash_ref;
            next;
        }

        push @stack, $hash_ref;
    }

    #print "first: $stack[0]->{letter} last: $stack[$#stack]->{letter}\n";
    push @pairs, [$stack[0]->{letter}, $stack[$#stack]->{letter}];

    $dbh->disconnect;

    return sub {
        shift @pairs;
    }
}

##########
# end main
##########

sub sumstack {
    my $count = 0;
    foreach my $ref (@_) {
        $count += $ref->{cnt};
    }
    return $count;
}


__END__
select username from users where left(username, 3) >= 'taf' and left(username, 3) <= 'tag';
