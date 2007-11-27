#!/usr/bin/perl

# $Id: staging.pl,v 1.1 2004/02/02 21:38:34 swain Exp $

my $debug = 0;

use strict;
use Net::DNS::Resolver;

open INFILE, "<domains" or die $!;


my $res   = Net::DNS::Resolver->new;


while (<INFILE>) {
    chomp;
    my $fqdn = $_;
    my $query = $res->search($fqdn);

    if ($query) {
        print "yay: $fqdn\n";
#         foreach my $rr ($query->answer) {
#             next unless $rr->type eq "A";
#             print $rr->address, "\n";
#         }
    } else {
        warn "query failed: ", $res->errorstring, " $fqdn\n";
    }
    
}


# $Log: staging.pl,v $
# Revision 1.1  2004/02/02 21:38:34  swain
# Wrote this on the fly for Gautam to find staging fqdns that were valid.
#
