#!/usr/bin/perl

#exit;

use strict;
use warnings;

use Net::SMTP;
require "/opt/mpa/lib/db-strict.pl";

my $debug = 0;
open LOG, ">> /tmp/log" or logdie $!;


sub logdie { print LOG "$_[0]\n"; exit(1); }


my $dbh = &MysqlConnect();

# use mysql to get the dates in the format we want: 2008-07-02
my $sth = $dbh->prepare("SELECT date_sub(date(now()), interval 1 day) AS yesterday, date(now()) AS today");
$sth->execute or logdie("Couldn't execute statement: $!\n");
print LOG "\nran the sql query\n" if $debug;


my $hash_ref = $sth->fetchrow_hashref;

$sth->finish;
$dbh->disconnect;

logdie "No yesterday or today\n" unless ( $hash_ref->{yesterday} && $hash_ref->{today} );
                                      
my $server   = 'https://svn.corp.myphotoalbum.com';
my $path     = '/home/swain/svn/svn2cl-0.10';
my $xsltproc = '/usr/bin/xsltproc';
my $svn      = '/opt/subversion/bin/svn';

# read in configuration for mpa. I don't want to deal with Tim's code,
# which cannot run under 'use strict' so I whipped this up. -SW

open CONFIGURATION, "< /opt/mpa/conf/mpa.conf" 
    or logdie "Cannot read mpa.conf: $!\n";

my %conf = ();

while (my $line = <CONFIGURATION>) {
    next unless $line =~ /=/; # lines without an equals sign are not interesting to us
    chomp $line;
    my ($key, $val) = split /\s*=\s*/, $line;
    $conf{$key} = $val;
}

my @lines = ();
my $command = "";
my $email_report;

if ($debug) {
    $email_report = \&dont_email_report;
} else {
    $email_report = \&email_report;
}

$command = "$svn log -r '{$hash_ref->{yesterday} 09:00:00}':'{$hash_ref->{today} 09:00:00}' $server/mpa_gallery  --xml --verbose | $xsltproc $path/svn2cl.xsl - 2>&1";
print LOG "$command\n" if $debug;
@lines = `$command`;
print LOG "gallery lines: ", scalar(@lines), "\n";
$email_report->( 'Gallery changelog', join("", @lines), $hash_ref->{yesterday} );

$command = "$svn log -r '{$hash_ref->{yesterday} 09:00:00}':'{$hash_ref->{today} 09:00:00}' $server/mpa_products --xml --verbose | $xsltproc $path/svn2cl.xsl - 2>&1";
print LOG "$command\n" if $debug;
@lines = `$command`;
print LOG "gifts lines: ", scalar(@lines), "\n";
$email_report->( 'Gifts changelog', join("", @lines), $hash_ref->{yesterday} );

$command = "$svn log -r '{$hash_ref->{yesterday} 09:00:00}':'{$hash_ref->{today} 09:00:00}' $server/mpa_static   --xml --verbose | $xsltproc $path/svn2cl.xsl - 2>&1";
print LOG "$command\n" if $debug;
@lines = `$command`;
print LOG "static lines: ", scalar(@lines), "\n";
$email_report->( 'Static changelog', join("", @lines), $hash_ref->{yesterday} );

$command = "$svn log -r '{$hash_ref->{yesterday} 09:00:00}':'{$hash_ref->{today} 09:00:00}' $server/mpa_cart     --xml --verbose | $xsltproc $path/svn2cl.xsl - 2>&1";
print LOG "$command\n" if $debug;
@lines = `$command`;
print LOG "cart lines: ", scalar(@lines), "\n";
$email_report->( 'Cart changelog', join("", @lines), $hash_ref->{yesterday} );


close LOG;



sub dont_email_report {
    for my $line (@_) { print LOG "line: $line"; }
}

sub email_report {

    my ($report_name, $report, $date) = @_;

    $conf{subject_line} = "SVN $report_name for $date";
    my $smtp = Net::SMTP->new($conf{'smtpserver'}, Debug => 0);

    unless ($smtp) {
        logdie "$0: ERROR: Could not connect to the mail server: $!\n";
    } 

    eval {
        #print("Attempting to send the message...");
        $smtp->mail($conf{sender});
        $smtp->to('swain@myphotoalbum.com');
        $smtp->cc('fmarte@myphotoalbum.com', 'jessy@myphotoalbum.com');

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

