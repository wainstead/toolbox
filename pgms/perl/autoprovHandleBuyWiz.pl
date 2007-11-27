#!/opt/perl5/bin/perl -w

# $Id: autoprovHandleBuyWiz.pl,v 1.1 2004/07/08 14:38:46 swain Exp $

# query LDAP for all orgs, and get their owners' data as well.

use strict;

use Net::LDAP qw(:all);
use Net::LDAP::Search qw(all_entries);
use Net::LDAP::Util qw(ldap_error_text
                       ldap_error_name
                       ldap_error_desc
                       );

my @fields = qw(
username
evwcleartextpassword
email
cn
sn
);



my $ldap = Net::LDAP->new('localhost:400') or die "$@";

$ldap->bind( 'cn=Directory Manager', password => '11223344');

print STDERR "bound. querying...\n";


my @testorgs = (
                'o=autoprovagain,ou=Clients,o=FC Gold,ou=Clients,o=FCDE'
                );


# for each installedOrganisztionDn...
foreach my $org (@testorgs) {

# query for the org; we'll get the org owner later from the trust list
    my $mesg = $ldap->search(
                             base => $org,
                             filter => '(objectclass=organization)',
                             attrs => [ 'evwtrustlist' ]
                             );

    print STDERR "done querying.\n";
#print Dumper($mesg);

    if ($mesg->code > 0)  { 
        print "ERROR 1: problem getting the organization data...\n";
        ldap_error_name($mesg->code);
        die $mesg->error; 
    }

    print STDERR "count: ", scalar($mesg->count), "\n";

    my $owner;
# this foreach loop isn't needed anymore, Trevor... you'll have to browse the
# API for Net::LDAP at
# http://search.cpan.org/~gbarr/perl-ldap/lib/Net/LDAP/Entry.pod or
# something similar. This might work:
# my $entry = $mesg->entry(0);
# for the first entry; the above ldap query should always return just one entry.

    foreach my $entry ($mesg->all_entries) {
        my $trustlist = $entry->get_value("evwtrustlist");
        if (not defined($trustlist)) {
            print STDERR "no trust list for: ", $entry->dn, "\n";
            next;
        }
        my @list = split('\|', $trustlist);
        #print scalar(@list), "\n";
        #print "owner: $list[2]\n";
        $owner = $list[2];
        print STDERR "Owner for $org:\n$owner\n";
    }


# now we have the userDn, stored in $owner. Use that as the base of a
# new query, and use @fields as the attribute list. Get the results and interpolate that into the email from Evolutionware, and put the file back into the queue.

}



# SF inserts nulls into the data, probably a bug in their C++ code.
sub stripnulls {
    my $thing = shift;
    #print "null in $thing\n" if ($thing =~ m/\x0/);
    $thing =~ s/\x0//g;
    return $thing;
}

sub dumprecord {
    my $hashref = shift;
    my $orgref = $hashref->{'orgdata'};
    my $userref = $hashref->{'userdata'};
    foreach my $key (keys %{$orgref}) {
        print $key, ": ", ${$orgref}{$key}, "\n";
    }
    print "---\n";
    foreach my $key (keys %{$userref}) {
        print $key, ": ", ${$userref}{$key},  "\n";
    }

}

# $Log: autoprovHandleBuyWiz.pl,v $
# Revision 1.1  2004/07/08 14:38:46  swain
# Initial version of a script that will eventually live in
# autoprovisioning. This version will work only on devil, as it has
# o=FCDE and stuff hardcoded in.
#
# Revision 1.1  2004/05/13 21:07:31  swain
# Initial commit: dump all org data to a tab delimited file, to be
# imported into MySQL.
#
