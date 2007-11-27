#!/usr/bin/perl -w

# little cgi for sending an email. test proggy for use with v3.com.
# esteban wainsteado, para ampira.com, 30 deciembre 2002
# $Id: mail.cgi,v 1.3 2003/01/08 16:04:04 swain Exp $


use strict;
use Mail::Sendmail;
use CGI qw/:standard/;

print "Content-type: text/html\n\n";
my $email = 0;
my $message = "Write a message here";
my ($subject, $to, $from);

if (param()) {
    $email = 1;
    $message = param('message') ? param('message') : "Write a message here";
    $subject = param('subject') ? param('subject') : "Hello, sailor!";
    $to      = param('to')      ? param('to')      : "swain\@ampira.com";
    $from    = param('from')    ? param('from')    : "test message <swain\@ampira.com>";
}

print <<"EOLN" unless $email;
<html>
<head>
<title>little mail sender</title>
</head>
<body>

<form name="email form" method="POST">
<input type="text" name="to" value="$to">:To<br>
<input type="text" name="subject" value="$subject">:From<br>

<textarea name="message">
$message
</textarea>

<br>
<input type="submit" value="send">

</form>
</body>
</html>

EOLN

my %mail = ( To      => $to,
             From    => $from,
             Subject => $subject,
             Message => $message,
             smtp => 'ims-1.corp.ampira.com'
           );

      sendmail(%mail) or print "<h3>$Mail::Sendmail::error</h3>\n";

      print "<pre>OK. Log says:\n", $Mail::Sendmail::log;

