#!/opt/perl5/bin/perl -w

# $Id: appendlogs.pl,v 1.2 2005/01/17 17:22:41 swain Exp $

# Append a CVS log tag to all files produced by the find command.

use strict;

my @files = ();

open PIPE, "find . -type f \\( -name \\*.php -o -name \\*.inc \\) |grep -v CVS |"
    or die "couldn't open pipe: $!\n";

open EXPORT, ">export.sh" or die $!;

my $counter = 0;

while (my $file = <PIPE>) {
    chomp $file;
    #print "jeebus: $file\n";
    # capture all current log info for this file
    my @logging = `cvs log $file`;
#     for (my $x = 0; $x < $#logging; $x++) {
#         print "$x: $logging[$x]";
#     }

    # make backup copy
    `cp $file $file.copy`;
    open FILE, ">> $file.copy" or die "$!\n";

    # print '<? /*' to the end of the file.
    print FILE "\n\n<?\n\n/*\n * \$Log\$\n";
    for (my $x = 16; $x < $#logging; $x++) {
        print FILE $logging[$x];
    }
    print FILE "\n */\n?>\n";
    close FILE;
    
    $counter++;
    #last if $counter > 2;

    # Rather than change the files, we print out a long shell script
    # to move the files over the originals.
    print EXPORT "mv $file.copy $file\n";
    print STDOUT "done: $file.\n";
}

close EXPORT;


# $Log: appendlogs.pl,v $
# Revision 1.2  2005/01/17 17:22:41  swain
# Comments, cleanup.
#
# Revision 1.1  2005/01/17 17:19:26  swain
# Before I lose this compeletely... here is how to append the CVS log
# tag to all files.
#
