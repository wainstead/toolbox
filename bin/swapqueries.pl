#!/usr/bin/env perl

# todo: add a feature that diffs the queries from input.sql and
# nfmc_reports.py (or whatever the user chose for scratch and report
# files); and show the timestamps on those files, and maybe the latest
# git log entry for the report file. Reason: I haven't used this in a
# week or two and I don't recall which is newer.

use Getopt::Long;

# assumption: the scratch file is always
# ~/sql/input.sql
$scratchfile = '/Users/swain/sql/input.sql';
$reportspath = '/Users/swain/git/pippin/sites/nfmc-reporting/mods/nfmcreporting/';

# In the script you're editing, your SQL query should begin and end
# with these comment lines. They tell this Perl script where the query
# stops and starts.
$STARTREGEXP = qr'-- swain start query';
$ENDREGEXP   = qr'-- swain end query';

# Log all changes we make. If we accidentally use --force going from
# one file to another and overwrite new code, we'll have the new code
# recorded somewhere.
$logfile = '/Users/swain/tmp/querylog';

$force  = '';
$target = '';
$report = 'nfmc_reports.py';

# override our default values above from the rc file, if one exists
if (-e "$ENV{'HOME'}/.swapqueriesrc.pl") {
    require "$ENV{'HOME'}/.swapqueriesrc.pl";
}

my $result = GetOptions("target=s" => \$target,
                        "force"    => \$force,
                        "report=s" => \$report
    );

$reportfile = "$reportspath$report";
usage("No such report file: '$reportfile'"             ) if      (! -e $reportfile            );
usage("You must specify the --target (got: '$target')" ) unless  ($target                     );
usage("Invalid target: '$target'"                      ) unless  ($target =~ /scratch|report/ );

if ($target eq 'report') {
    # put the query into the report file
    $source = $scratchfile;
    $target = $reportfile;
} elsif ($target eq 'scratch') {
    # put the query into the scratch file
    $source = $reportfile;
    $target = $scratchfile;
} else {
    usage("Value of 'target' was unknown (wtf?)");
}

# Normally this script blocks the user from overwriting a more
# recently modified file. This behavior can be overridden with the
# --force command line option.
if (not $force) {

    $source_modfiy_time = (stat($source))[9];
    $target_modify_time = (stat($target))[9];

    if ($target_modify_time >= $source_modfiy_time) {
        die "ERROR: Target file is newer than or same age as source file.\n";
    }
}

# This logs the target's query, which will be otherwise lost in a
# moment... I suppose that's a "side effect" and we should do it more
# explicitly...
parse_out_query($target);

@sourcequery = parse_out_query($source);
write_to_target_file($target, @sourcequery);
exit(0);

# given the path to a file, parse out the block of text we are
# interested it, return it
sub parse_out_query {
    $inputfile = shift;
    die "Source file does not exist: '$inputfile'" unless $inputfile && -e $inputfile;

    open INPUTFILE, "< $inputfile"
        or die "Couldn't read source file '$inputfile': $!\n";

# While reading in the file we can be in the following states:
# 1: Haven't found the start boundary marker yet
# 2: Found the start boundary marker, storing up the query
# 3: Found the end boundary marker, close the file
    $state = 1;
    my @query;

    while (my $line = <INPUTFILE>) {
        if ($state == 1) {
            if ($line =~ $STARTREGEXP) {
                $state = 2;
                push @query, $line;
                next;
            }
        } elsif ($state == 2) {
            push @query, $line;
            if ($line =~ $ENDREGEXP) {
                close INPUTFILE;
                last;
            }
        }
    }

    # both report and scratch files must have a query in them
    die "Input file '$inputfile' has no query in it (did you forget the boundary markers?\n" if (scalar(@query) == 0);
    log_query($inputfile, @query);
    return @query;
}


sub log_query {
    # safety first: log all queries we've parsed out. We might write
    # an old one over a new one. Plus disk space is cheap.
    open LOGFILE, ">> $logfile" or die $!;
    $filename = shift;
    @query = @_;
    print LOGFILE scalar localtime(), "\n";
    print LOGFILE $filename, "\n", @query;
    close LOGFILE;
    print "Query from '$filename' logged to $logfile.\n";
}

sub write_to_target_file {
    ($target, @query) = @_;
    my @original = `cat $target`;
    open TARGET, "> $target" or die $!;

    $placeholder = 0;
    $skip = 0;
    foreach my $line (@original) {
        $placeholder++;
        last if ($line =~ $ENDREGEXP);
        if ($line =~ $STARTREGEXP) {
            $skip = 1;
        }
        print TARGET $line if not $skip;
    }

    foreach my $line (@query) {
        print TARGET $line;
    }


    for ($idx = $placeholder; $idx <= $#original; $idx++) {
        print TARGET $original[$idx];
    }

    close TARGET;
    print "Wrote query to $target.\n";
}

sub usage {
    $msg = shift;

    die <<"EOLN";
ERROR: $msg

Usage: $0 [--force] --target=[scratch|report] [reportfile]

Where:
    --force If the target file is older than the source file, do not abort

    --target=[scratch|report] Write to the scratch file (default input.sql)
                               or the target file (default nfmc_reports.py)

   [reportfile] Optionally specify the report file; default is nfmc_reports.py
EOLN
}

__DATA__
known states for writing file out:
1: printing file up to query
2: reached query, must scroll past it
3: print each line of the new query
4: print remainder of the file
