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


