#!/usr/bin/perl -w

# script to take excel csv file and output xml for evw. 
# swain, ampira, 2003 january
# $Id: ireg.pl,v 1.1 2003/01/20 22:26:28 swain Exp $

use strict;

my $ctr;
open FILE, $ARGV[0] or die $!;


# create array of column names. yay.
my @cols;
my $i = 0;
while (<DATA>) {
    chomp;
    $cols[$i++] = $_;
}

print "I have $#cols columns.\n";

while (<FILE>) {
    $ctr++;
    #chomp;
    # chomp causes a bug.. it doesn't remove \r
    s/\r//g;
    s/\n//g;
    my @fields = split /,/;
    print "length: $#fields\n";
    if ($#fields != $#cols) {
        warn "Oops, line imported from Excel had wrong number of fields.\n";
        warn "(it had $#fields, was expecting $#cols\n";
    }
    for my $x (0..$#fields) {
        print "$cols[$x]: $fields[$x]\n";
    }
    print "----------------------------\n";
}

print "read in $ctr lines.\n";

__END__
package_name
record_id
domain_name
user_name
password
hint_question
hint_answer
first_name
last_name
master_acct_name
email
phone
fax
address_1
address_2
city
state
foreign_state
zip
country
bill_address_1
bill_address_2
bill_city
bill_state
bill_foreign_state
bill_zip
bill_country
cc_name
cc_type
cc_number
cc_exp_date
cc_clear_number
