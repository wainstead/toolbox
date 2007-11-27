#!/opt/perl5/bin/perl -w

use strict;

my $homedir = '/opt/evw/scripts/batchreports';
chdir $homedir;

open INFILE, "<$homedir/dailyMarketingReport.tsv" or die "$0: Can't open $homedir/dailyMarketingReport.tsv: $!\n";
open OUTFILE, ">$homedir/dailyMarketingReport.csv" or die "$0: Can't write $homedir/dailyMarketingReport.csv:$!\n";;
my $highest = 0;

my $MAXPACKAGEFIELDS = 3; # counting from zero

my $header = <INFILE>;
chomp $header;
$header = "$header\tORGDATE\tANNDATE\tPKG1\tPKG2\tPKG3\tPKG4\n";

#&looksee($header);
print OUTFILE $header;


while (<INFILE>) {
    chomp;
    next unless /\w/;
    my @fields = split /\t/;

    # add action date in m/d/y format
    my $anndate = "$fields[20]/$fields[21]/$fields[19]";

    # add org annivesary date in m/d/y format
    my $orgdate = "$fields[29]/$fields[30]/$fields[28]";
    $_ .= "\t$anndate\t$orgdate";

    #print "package name: $fields[25]\n";
    my @pkg = split /\s*-\s*/, $fields[25];
    if ($#pkg < $MAXPACKAGEFIELDS) {
        my $x;
        #print "was: " . scalar(@pkg);
        for $x (scalar(@pkg) .. $MAXPACKAGEFIELDS) {
            $pkg[$x] = "";
        }
        #print " is now: " . scalar(@pkg) . "\n";
    }

    my $count = scalar @pkg;
    if ($count > $highest) {
        $highest = $count;
    }

    my $newcols = join("\t", @pkg);
    $_ .= "\t$newcols";
    print OUTFILE "$_\n";

}
#print "highest: $highest\n";


sub looksee {
    my $thing = shift;
    my @h = split /\t/, $thing;
    for (my $x = 0; $x < scalar(@h); $x++) {
        print "$x: $h[$x]\n";
    }
    exit(0);
}
