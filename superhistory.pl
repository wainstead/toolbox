#!/usr/bin/perl

# $Id: superhistory.pl,v 1.4 2005/01/31 23:46:39 swain Exp $

# keep a history of all commands.
# March 2003, Steve Wainstead

# file where we keep all of history

my $sh_file = "$ENV{'HOME'}/.superhistory";
my $history = "$ENV{'HOME'}/.bash_history";


open HFILE, "<$history" 
    or die "Can't read history file '$history': $!\n";

while (<HFILE>) {
    chomp;
    $commands{$_}++;
}

close HFILE;

open SHFILE, "<$sh_file"
    or warn "Can't read superhistory file: $!\n";

while (<SHFILE>) {
    chomp;
    $commands{$_}++;
}

close SHFILE;

open SHFILE, ">$sh_file" 
    or die "Can't open superhistory file for writing: $!\n";


foreach $command (sort keys %commands) {
    print SHFILE "$command\n";
}




__END__

# $Log: superhistory.pl,v $
# Revision 1.4  2005/01/31 23:46:39  swain
# Generic home directory references.
#
# Revision 1.3  2004/08/24 19:00:53  swain
# Generalized how we refer to files in our home directory (via $ENV{HOME})
#
# Revision 1.2  2003/09/02 19:44:36  swain
# added id and log
#
