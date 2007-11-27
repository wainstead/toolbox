#!/usr/bin/perl -w


# Occasionally, the orderCompletion.xml file has more files appended
# to it, when it is not moved out of the way. Then the XML parser
# fails. This script breaks the orderCompletion.xml file into little
# separate files so they can be processed one at a time, by hand. You
# have to rename each file (i.e. mv oc.1 orderCompletion.xml) and then
# rerun /opt/mpa/dpi/bin/remove_completed_orders.pl -v >> $MPA_LOGFILE
# 2>&1

# Due to a bug, the first file is oc.0 and it's empty. I'm not going
# to bother fixing it.

use strict;

my $filecounter = 0; # use this as an extension

open INFILE, "<  /opt/proftpd/var/ftp/pub/orderCompletion.xml.whole" 
    or die "Can't read in xml file: $!\n";

open OUTFILE, " > /opt/proftpd/var/ftp/pub/oc.$filecounter " 
    or die "Can't write oc.$filecounter: $!\n";

while (<INFILE>) {
    if (/^<\?xml/) {
        # we've reached a new xml file
        close OUTFILE;
        $filecounter++;
        die "Already exists: oc.$filecounter\n" if ( -e "oc.$filecounter");
        open OUTFILE, " > /opt/proftpd/var/ftp/pub/oc.$filecounter "
            or die "Can't write oc.$filecounter: $!\n";
    }
    print OUTFILE;
}

close OUTFILE;
close INFILE;
