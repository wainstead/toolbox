#!/opt/perl5/bin/perl -w

# $Id: ldap-get-users.pl,v 1.1 2004/05/13 21:21:02 swain Exp $

# query LDAP for all users

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
evworgdn
sn
);


my $ldap = Net::LDAP->new('localhost:400') or die "$@";

$ldap->bind( 'cn=Directory Manager', password => '11223344');

print STDERR "bound. querying...\n";

my $attrs = \@fields;

# query for the org; we'll get the org owner later
my $mesg = $ldap->search(
                         base => 'o=FCDE',
                         filter => '(objectclass=person)',
                         attrs => $attrs
                         );

print STDERR "done querying.\n";
#print Dumper($mesg);

if ($mesg->code > 0)  { 
    print "ERROR 1: problem getting the organization data...\n";
    ldap_error_name($mesg->code);
    die $mesg->error; 
}

print STDERR "count: ", scalar($mesg->count), "\n";


foreach my $entry ($mesg->all_entries) {

    my @output;
    push @output, stripnulls($entry->dn);
    foreach my $attr (@fields) {
        push @output, stripnulls( $entry->get_value($attr) );
    }
    
    print join("\t", @output), "\n";
}


# SF inserts nulls into the data, probably a bug in their C++ code.
sub stripnulls {
    my $thing = shift;
    return "" unless $thing;
    #print "null in $thing\n" if ($thing =~ m/\x0/);
    $thing =~ s/\x0//g;
    return $thing;
}

# $Log: ldap-get-users.pl,v $
# Revision 1.1  2004/05/13 21:21:02  swain
# Pull all users from ldap, and output in tab delimited format for
# import into MySQL. Hmm. I suppose I could have just created INSERT
# statements but why not "leverage" existing tools?
#
