#!/usr/bin/perl -w

# $Id: ldap-get-orgs.pl,v 1.2 2004/05/14 14:26:44 swain Exp $

# query LDAP for all orgs, and get their owners' data as well.

use strict;

use Net::LDAP qw(:all);
use Net::LDAP::Search qw(all_entries);
use Net::LDAP::Util qw(ldap_error_text
                       ldap_error_name
                       ldap_error_desc
                       );

my @fields = qw(
cn
evwdescription
evwemailaddress
evwispdn
evwpostal1
evwpostal2
evwpostalcity
evwpostalcountry
evwpostalstate
evwpostalzip
evwstreet1
evwstreet2
evwstreetcity
evwstreetcountry
evwstreetstate
evwstreetzip
evwtrustlist
facsimiletelephonenumber
telephonenumber
);


my $ldap = Net::LDAP->new('localhost:2000') or die "$@";

$ldap->bind( 'cn=Directory Manager', password => '');

print STDERR "bound. querying...\n";

my $attrs = \@fields;

# query for the org; we'll get the org owner later
my $mesg = $ldap->search(
                         base => 'o=FCTY',
                         filter => '(objectclass=organization)',
                         attrs => $attrs
                         );

print STDERR "done querying.\n";
#print Dumper($mesg);


print STDERR "count: ", scalar($mesg->count), "\n";

if ($mesg->code > 0)  { 
    print "ERROR 1: problem getting the organization data...\n";
    ldap_error_name($mesg->code);
    die $mesg->error; 
}


foreach my $entry ($mesg->all_entries) {
    my $trustlist = $entry->get_value("evwtrustlist");
    if (not defined($trustlist)) {
        print STDERR "no trust list for: ", $entry->dn, "\n";
        next;
    }
    my @list = split('\|', $trustlist);
    #print scalar(@list), "\n";
    #print "owner: $list[2]\n";
    my $owner = $list[2];

    my @output;
    foreach my $attr (@fields) {
        if ($attr eq 'evwtrustlist') {
            push @output, $owner;
        } else {
            push @output, stripnulls( $entry->get_value($attr) );
        }
    }
    
    print join("\t", @output), "\n";
}


# SF inserts nulls into the data, probably a bug in their C++ code.
sub stripnulls {
    my $thing = shift;
    #print "null in $thing\n" if ($thing =~ m/\x0/);
    $thing =~ s/\x0//g;
    return $thing;
}


# $Log: ldap-get-orgs.pl,v $
# Revision 1.2  2004/05/14 14:26:44  swain
# This version is tweaked to run off borgcube, where it will probably have to live. The version of Net::LDAP on evw-1.prv is out of date so it won't run there. Note I removed the password.
#
# Revision 1.1  2004/05/13 21:07:31  swain
# Initial commit: dump all org data to a tab delimited file, to be
# imported into MySQL.
#
