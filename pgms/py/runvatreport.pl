#!/opt/perl5/bin/perl -w

# $Id: runvatreport.pl,v 1.1 2003/10/20 21:58:13 swain Exp $

# Run the vat report quarterly, send results to Keith, cc me and swolf


use Date::Manip;
use MIME::Entity ;
use Net::SMTP ;

my @cclist = ( 'swolf@ampira.com',
               'swain@ampira.com'
	       );

my $msg =  MIME::Entity->build( 
				From => 'swain@ampira.com',
                                To   => 'keith@ampira.com',
                                Cc   => \@cclist,
                                Subject => "VAT quarterly report",
                                Data    => ["\n",
					    "Please see attached report.",
					    "\n"]
                                );



#  my $rc = 0xffff & system ("./eftnetDailyTransactionReport.pl $year-$mon-$day  report.txt |/usr/bin/unix2dos > eftnetTransactionReport_$rd.txt");
my $rc = 0xffff & system ("/opt/evw/scripts/batchreports/vatreport.py | /usr/bin/unix2dos > /tmp/vatreport.csv");
if ($rc == 0) {
    $msg->attach( Path  =>  "/tmp/vatreport.csv",
                  Type  =>  "text/plain",
                  Encoding => "-SUGGEST",
                  Filename => "vatreport.csv",
		Disposition => "attachment",
#                  Disposition => "inline",
                  'x-unix-mode' => "0600",
                  );
} else { 
    die "Failed to send the vat report ($!)\n";
}

$msg->smtpsend( Host =>  'ims-1.corp.ampira.com' );
