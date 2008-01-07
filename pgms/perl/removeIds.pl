#!/usr/bin/perl -w

open INPUTLIST, "< delme" or die $!;

while ($filedata = <INPUTLIST>) {
    chomp $filedata;
    ($filename, $pos, $string) = split ':', $filedata, 3;
    print "line $pos of file $filename\n";
    die "bad line number in $fildata\n" unless $pos > 0;
    die "bad filename in $filedata\n" unless -e $filename;
    open INFILE, $filename or die "Can't open $filename: $!\n";
    @lines = ();
  INNERLOOP:
    while ($line = <INFILE>) {
        if ($. == $pos) {
            print "Skipping line $. ($pos): $line";
            next INNERLOOP;
        }
        push @lines, $line;
    }

    close INFILE;

    die "Had no lines in the array\n" unless scalar(@lines);

    open OUTFILE, "> $filename" or die "Can't write outfile $filename: $!\n";
    print OUTFILE join('', @lines);
    close OUTFILE;
}


print "End of line.\n";
