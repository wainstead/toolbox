#!/usr/bin/perl

my $debug = 0;

use strict;
use Email::Valid;

$SIG{ALRM} = \&timed_out;

my ($fieldnum, $fieldsep);

die "Usage: $0 property-name file-name|n" unless $ARGV[1];

if ($ARGV[0] eq 'fc') {
    $fieldnum = 2;
    $fieldsep = ",";
} elsif ($ARGV[0] eq 'v3') { 
    $fieldnum = 0;
    $fieldsep = "\t";
} elsif ($ARGV[0] eq 'paidampira') { 
    $fieldnum = 5;
    $fieldsep = "\t";
} elsif ($ARGV[0] eq 'unpaidampira') { 
    $fieldnum = 2;
    $fieldsep = "\t";
} else {
    die "no correct property name passed in (must be v3, fc, paidampira or allampira)\n";
}

my (%bad, %good); # store domains that are good or bad
my $counter = 0;
my $checker = Email::Valid->new( -mxcheck => 1);
my $ts = time;


open INFILE, "<$ARGV[1]" or die "can't read: $!\n";
open OUTFILE, ">$ARGV[1].good" or die "Can't write: $!\n";
open REJECTS, ">$ARGV[1].rejects" or die "Can't write slowpokes file: $!\n";

while (my $line = <INFILE>) {
    $counter++;
#    next unless $counter > 0;
#    last if $counter > 4001;
    unless ($counter % 1000) {
        print STDERR "$ARGV[1]: $counter done, ", timestamp(), " elapsed\n";
    }
    my @fields = split /$fieldsep/, $line;

    my $fqdn = get_fqdn($fields[$fieldnum]);

    # case 1: known good fqdn, validate the address.
    if (exists($good{$fqdn})) {
        print STDERR "$counter: Already checked $fqdn, testing for rfcness: " if $debug;
        if (Email::Valid->address($fields[$fieldnum])) {
            print STDERR "$fields[$fieldnum] passes.\n" if $debug;
            print OUTFILE $line;
        } else {
            print STDERR "$fields[$fieldnum] failed.\n" if $debug;
        }

    # case 2: known bad fqdn.
    } elsif (exists($bad{$fqdn})) {

        # say goodnight gracie
        print STDERR "$counter: $fields[$fieldnum] has a known bad fqdn. NEXT!\n" if $debug;
        print REJECTS "$fields[$fieldnum]\n";
        next;

    } else {

        # we do this the hard way. use eval{}; to trap Net::DNS timeouts.
        eval {

            alarm(5);            
            # case 3: fqdn and rfc good.
            if ($checker->address($fields[$fieldnum])) {
                alarm(0);
                print STDERR "$counter: $fields[$fieldnum] passes.\n" if $debug;
                print OUTFILE $line;
                # add domain to 'good' hash
                $good{$fqdn}++;
            } else {
                alarm(0);
                # case 4: mx bad
                if ($checker->details eq 'mx') {
                    # domain no good, add to bad domain hash
                    print STDERR "$counter: $fields[$fieldnum] failed for mx reasons\n" if $debug; 
                    $bad{$fqdn}++;
                    print REJECTS "$fields[$fieldnum]\n";
                # case 5: not rfc compliant.    
                } elsif ($checker->details eq 'rfc822') {
                    # email address sucked
                    print STDERR "$counter: '$fields[$fieldnum]' failed for rfc822 reasons\n" if $debug;
                }
            }

        };
        if ($@) {
            print STDERR "$counter: oops: $@ for $fields[$fieldnum]\n" if $debug;
            $bad{$fqdn}++;
            print REJECTS "$fields[$fieldnum]\n";
        }

    }
}

my ($key, $val);

if ($debug) {
    print STDERR "good fqdns:\n";
    foreach $key (keys %good) {
        print STDERR "$key ($good{$key})\n";
    }
    
    print STDERR "bad fqdns:\n";
    foreach $key (keys %bad) {
        print STDERR "$key\n";
    }
}

print STDERR "$ARGV[1]: done. ", timestamp(), " elapsed.\n";

sub get_fqdn {
    my $address = shift;
    my ($crap, $fqdn) = split '@', $address;
    return $fqdn;
}

sub timed_out {
    die "lookup took too long";
}

sub timestamp {
    my $now = time - $ts;
    return int($now / 60) . ":" . ($now %60);
}
