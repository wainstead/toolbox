#!/usr/bin/perl

use strict;
use warnings;

use Net::SMTP;
require "/opt/mpa/lib/db-strict.pl";

my $dbh = &MysqlConnect();

my $sth = $dbh->prepare("SELECT date_sub(date(now()), interval 1 day) AS yesterday, date(now()) AS today");
$sth->execute;


my $hash_ref = $sth->fetchrow_hashref;
my $server = 'https://svn.corp.fortunecity.com';



# read in configuration for mpa. I don't want to deal with Tim's code,
# which cannot run under 'use strict' so I whipped this up. -SW

open CONFIGURATION, "< /opt/mpa/conf/mpa.conf" 
    or die "Cannot read mpa.conf: $!\n";

my %conf = ();

while (my $line = <CONFIGURATION>) {
    next unless $line =~ /=/; # lines without an equals sign are not interesting to us
    chomp $line;
    my ($key, $val) = split /\s*=\s*/, $line;
    $conf{$key} = $val;
}

my @lines = ();

@lines = `svn log -r '{$hash_ref->{yesterday} 09:00:00}':'{$hash_ref->{today} 09:00:00}' $server/mpa_gallery  --xml --verbose | xsltproc svn2cl.xsl - `;
email_report( 'Gallery changelog', join("", @lines) );

@lines = `svn log -r '{$hash_ref->{yesterday} 09:00:00}':'{$hash_ref->{today} 09:00:00}' $server/mpa_products --xml --verbose | xsltproc svn2cl.xsl - `;
email_report( 'Gifts changelog', join("", @lines) );

@lines = `svn log -r '{$hash_ref->{yesterday} 09:00:00}':'{$hash_ref->{today} 09:00:00}' $server/mpa_static   --xml --verbose | xsltproc svn2cl.xsl - `;
email_report( 'Static changelog', join("", @lines) );

@lines = `svn log -r '{$hash_ref->{yesterday} 09:00:00}':'{$hash_ref->{today} 09:00:00}' $server/mpa_cart     --xml --verbose | xsltproc svn2cl.xsl - `;
email_report( 'Cart changelog', join("", @lines) );



$sth->finish;
$dbh->disconnect;

sub email_report {

    my ($report_name, $report) = @_;

    $conf{subject_line} = "SVN $report_name for " . scalar(localtime());
    my $smtp = Net::SMTP->new($conf{'smtpserver'}, Debug => 0);

    unless ($smtp) {
        die "$0: ERROR: Could not connect to the mail server: $!\n";
    } 

    eval {
        #print("Attempting to send the message...");
        $smtp->mail($conf{sender});
        $smtp->to('swain@corp.fortunecity.com');
        #$smtp->cc('fmarte@corp.fortunecity.com');

        $smtp->data();

        $smtp->datasend("To: $conf{sender}\n");
        $smtp->datasend("From: $conf{sender}\n");
        $smtp->datasend("Subject: $conf{subject_line}\n");
        $smtp->datasend("\n");
        $smtp->datasend( $report );
        $smtp->dataend();


        $smtp->quit();
    };

    if ($@) {
        print "Got an exception sending email: $@\n";
        exit(1);
    }

}

