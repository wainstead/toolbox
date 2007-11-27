#!/opt/perl5/bin/perl -w

# go forth and get all users and all orgs.

# the idea here is that we can search for all matches on
# objectclass=organization OR objectclass=person. This should return
# everything and in theory the person whose email matches the org
# contact email is the owner.

use strict;

use Net::LDAP;
use Net::LDAP::Search qw(all_entries);

print "Net LDAP Version: $Net::LDAP::VERSION\n";

my $ldap = Net::LDAP->new('localhost:2000') or die "$@";

$ldap->bind( 'cn=Directory Manager', password => 'Ld@p416.');

print STDERR "bound. querying...\n";

my $attrs = "";
my $mesg = $ldap->search(
                        base => 'o=HostBran,ou=Clients,o=FCTY',
                        #base => 'o=FCTY',
                        filter => '(|(objectclass=organization)(objectclass=person))',
                        attrs => $attrs
                 
                      );

print STDERR "done querying.\n";


$mesg->code && die $mesg->error; 

print STDERR "looping...\n";

my (%persons, %orgs, @owners);

foreach my $entry ($mesg->all_entries) {

    my %hash;
    # stolen: http://docsrv.sco.com:8457/cgi-bin/pod2html/site-perl/Net/LDAP/Entry.html
    $hash{'dn'} = $entry->dn;
    #print "dn: ", $entry->dn, "   ";
    foreach my $attr ($entry->attributes) {
        #print $attr,": ",  $entry->get_value($attr), "   ";
        $hash{$attr} = $entry->get_value($attr);
    }

    # loop over the objectclass attributes (there are a few) and find
    # out if this is a person or an organization.
HOOHA:
    foreach my $attr ($entry->get_value("objectclass")) {

        #my $email = $entry->get_value("evwemailaddress");

        if ($attr eq 'person') {
#            print "$attr\n";
            $persons{ $entry->dn } = \%hash;
            last HOOHA;
        } elsif ($attr eq 'organization') {
#            print "$attr\n";
            my @list = split('\|', $entry->get_value("evwtrustlist"));
            #print scalar(@list), "\n";
            print "owner: $list[2]\n";
            push @owners, $list[2];
            $hash{'owner'} = $list[2];
            #print "owner: " .  $entry->get_value("evwtrustlist"), "\n";
            $orgs{ $entry->dn } = \%hash;
            last HOOHA;
        }
    }

    #print "\n\n";



}

foreach my $owner (@owners) {
    unless ( exists($persons{$owner}) ) {
        print "$owner is not a person\n";
    }
}

print STDERR "number of persons: ", scalar(keys %persons), "\n";
print STDERR "number of orgs: ",    scalar(keys %orgs), "\n";

# foreach $person (@persons) {
#     print join(" ", %{$person}), "\n";
# }

# fix crappy data from EVW. SF inserts nulls.
sub stripnulls {
    my $thing = shift;
    #print "null in $thing\n" if ($thing =~ m/\x0/);
    $thing =~ s/\x0//g;
    return $thing;
}
