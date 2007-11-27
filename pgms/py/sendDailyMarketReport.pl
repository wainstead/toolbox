#!/opt/perl5/bin/perl -w

use Date::Manip;
use MIME::Entity ;
use Net::SMTP ;


@fields = localtime();

@fields = localtime(time - (60 * 60 * 24));
$year = $fields[5] + 1900;
$mon  = prepend($fields[4] + 1);
$day  = prepend($fields[3]);

$yesterday = "$year$mon$day";


# print scalar localtime;
# print "\n";
# print "$today\n";
# print "$0: using $yesterday\n";


my $homedir = "/opt/evw/scripts/batchreports";

chdir $homedir;

if (-e "$homedir/dailyMarketingReport.csv") {
    unlink("$homedir/dailyMarketingReport.csv");
} else {
    #print "There was no old report to unlink (which is fine).\n";
}

my $command = "$homedir/makeMktReport.py $yesterday $yesterday admin 'sffc:)' ";
my $postprocess  = "$homedir/postprocess.pl";
my $cleancommand = "perl -pi -e 's/,/;/g; s/\\t/,/g' $homedir/dailyMarketingReport.csv\n";



my $rc = 0xffff & system ($command);
#print "I ran the report generator.\n";
$rc = 0xffff & system ($postprocess);
$rc = 0xffff & system ($cleancommand);
#print "I cleaned the file. Building the msg...\n";

my @cclist = ( 'rob@ampira.com', 'andreea@fortunecity.com' );
#my @cclist = ( 'swain@panix.com' );


my $msg =  MIME::Entity->build( 
				From => 'swain@ampira.com',
                                To   => 'swain@ampira.com',
                                Cc   => \@cclist,
                                Subject => "Daily marketing report (all visps)",
                                Data    => ["\n",
					    "Please see attached report.",
					    "\n"]
                                );


#print "Attaching the report...\n";

if ($rc == 0) {
    $msg->attach( Path  =>  "$homedir/dailyMarketingReport.csv",
                  Type  =>  "text/plain",
                  Encoding => "-SUGGEST",
                  Filename => "dailyMarketingReport.csv",
		Disposition => "attachment",
#                  Disposition => "inline",
                  'x-unix-mode' => "0600",
                  );
} else { 
    die "Failed to attach the daily marketing report ($!)\n";
}





$msg->smtpsend( Host =>  'ims-1.corp.ampira.com' );


# date fields sometimes need a zero prepended.
sub prepend {
    my $thing = shift;
    if (length($thing) == 1) {
        return "0$thing";
    } else {
        return $thing;
    }
}

