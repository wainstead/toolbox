#!/opt/perl5/bin/perl

# $Id: ldappaidusers.pl,v 1.2 2005/01/31 23:49:02 swain Exp $

# Query ldap for all orgs and the names of the people who own them
# (their names are not stored in the org record, it's the first person
# in that org that owns it.

# Steve Wainstead, Ampira, August 2003

use Net::LDAP;
use Net::LDAP::Search qw(all_entries);

#use Storable;
use Data::Dumper;

# this is suitable for orgs only
my $attrs = [ qw(cn telephonenumber evwemailaddress
                 evwstreet1 evwstreet2 evwpostalcity
                 evwpostalstate evwpostalzip 
                 evwpostalcountry) ];

#my $attrs = [ qw( cn sn evwemailaddress evworgdn) ];

# build a hash of the organisationDns we are interested in
# for example we could query DB2 for a list of all organisationDns
# like so:
# -- select all orgDns created since Aug 15, 2003
# db2 "select organisationdn from accounts a, accountholders ah where
# (instday > 14 and instmonth > 7 and instyear = 2003) and
# a.accountholderid = ah.accountholderid" > sinceAug

if ($ARGV[0]) {
    # we have a list to compare to
    open INFILE, "<$ARGV[0]" or die "Can't read '$ARGV[0]' for reading: $!\n";
    while (<INFILE>) {
        chomp;
        $filter{$_}++;
    }
    print STDERR "Read in " . scalar(keys %filter) . " for filtering.\n";
} else { 
    print STDERR "NOT FILTERING data, all orgs will be returned.\n";
}


my $ldap = Net::LDAP->new('localhost:2000') or die "$@";

$ldap->bind( 'cn=Directory Manager', password => 'Ld@p416.');

print STDERR "bound. querying...\n";

$mesg = $ldap->search(
                        #base => 'o=GlobalScape,ou=Clients,o=FCTY',
                        base => 'o=FCTY',
                        filter => '(evworgtype=ORG)',
                        attrs => $attrs
                 
                      );

print STDERR "done querying.\n";

$mesg->code && die $mesg->error; 

print STDERR "looping...\n";


foreach $entry ($mesg->all_entries) {

    my @values = ();


    my $dn = $entry->dn;
    unless (defined($ARGV[0]) && exists($filter{$dn})) {
        print STDERR "$dn not in filter list.\n";
        next;
    }

    $counter++ || print STDERR ref($entry) . "\n"; # first pass, print the ref type, else inc counter
    #$entry->dump;


    my $email = $entry->get_value('evwemailaddress');
    #print "dn: $email $dn\n";
    #next;

    $fnsearch = $ldap->search(
                          base => $dn,
                          filter => "(&(objectclass=person)(evwemailaddress=$email))",
                          attrs => [ 'cn', 'sn','evworgdn' ]
                          );
    print STDERR "number returned: " . $fnsearch->count . "\n";

    # should only loop once
    if ($fnsearch->count) {
        foreach $record ($fnsearch->all_entries) {
            push @values, stripnulls($record->get_value('cn'));
            push @values, stripnulls($record->get_value('sn'));
            push @values, stripnulls($record->get_value('evworgdn'));
            #print "result: " , join " ", @values, "\n";
        }
    } else {
        push @values, "","","";
    }

    foreach my $attr (@$attrs) {
        #print "attr: $attr, value: " .  $entry->get_value($attr) . "\n";
        push @values, stripnulls($entry->get_value($attr));
    }
    #next;    

    print join("\t", @values), "\n";
}

print STDERR "count: $counter\n";


sub stripnulls {
    my $thing = shift;
    #print "null in $thing\n" if ($thing =~ m/\x0/);
    $thing =~ s/\x0//g;
    return $thing;
}



###
###
###




# abandoned code follows
__END__




#print ref($mesg), "\n";

#store($mesg->as_struct, "ldap.dump");

open STORAGE, ">dump.out" or die $!;
print STORAGE Data::Dumper->Dump([$mesg], ["mesg"]);
close STORAGE;

undef $mesg;
$ldap->unbind; # unbind
exit;
###

#$mesg = retrieve("ldap.dump");
