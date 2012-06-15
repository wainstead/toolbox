#!/usr/bin/env perl

use Getopt::Long;

my $path = '/Users/swain/git/pippin/sites/nfmc-reporting/mods/nfmcreporting/';

my $force  = '';
my $target = '';
my $report = 'nfmc_reports.py';

my $result = GetOptions("target=s" => \$target,
                        "force"    => \$force,
                        "report=s" => \$report
    );


$reportfile = "$path$report";
usage("No such report file: '$reportfile'") if (! -e $reportfile);
usage("You must specify the --target") if (! $target);
usage("Invalid target: '$target'") unless ($target =~ /scratch|report/);
print "$target $force $reportfile\n";

sub usage {
    $msg = shift;

    die <<"EOLN";
ERROR: $msg

Usage: $0 [--force] --target=[scratch|report] [reportfile]

Where:
    --force If the target file is older than the source file, do not abort

    -- target=[scratch|report] Write to the scratch file (default input.sql)
                               or the target file (default nfmc_reports.py)

   [reportfile] Optionally specify the report file; default is nfmc_reports.py
EOLN
}
