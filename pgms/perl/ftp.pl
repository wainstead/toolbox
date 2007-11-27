#!/usr/bin/perl -w

# $Id: ftp.pl,v 1.2 2006/05/23 14:17:19 swain Exp $

use strict;
use Net::FTP;
use vars ('$ftp');

print "Hello, sailor!\n";

$ftp = Net::FTP->new("ftp.fortunecity.com", TIMEOUT => 300) or die "No connect to ftp: $@\n";

$ftp->login("kingpoop", "vhnvupvz") || die "$0:  no login for you: ", $ftp->message, "\n";
print "connected...\n";

#$ftp->rmdir( "testdir" ) or print "Error: could not create directory: ", $ftp->message, "\n";

my $pid;
print "I am $$\n";
#my $result = $ftp->put('PB020037.JPG');
#print "xfer'd: $result\n";
print $ftp->pwd;
#print "prior to fork: ", $ftp->pwd(), "\n";

# if ($pid = fork) {
#     print "$$ Hello, I'm the if=true.\n";
#     my $result = $ftp->put('PB020037.JPG');
#     print "xfer'd: $result\n";
#     waitpid($pid,0);

# } else {
#     print "$$ Hello, I'm the else.\n";
#     sleep(2);
#     my $ls = $ftp->ls();
#     print "ls: ", join("\n", @$ls), "\n";
#     exit;
# }


$ftp->quit;

print "End of line.\n";

# $Log: ftp.pl,v $
# Revision 1.2  2006/05/23 14:17:19  swain
# backing up before bork bellies up
#
# Revision 1.1  2005/06/08 13:18:59  swain
# Dead end script attempting to send to the command channel while
# sending on the data channel. But I have a simpler idea...
#
