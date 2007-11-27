#!/opt/perl5/bin/perl

# $Id: chext.pl,v 1.1 2003/11/11 22:02:22 swain Exp $
# change the extensions of all matching files in current working directory

die "Usage: $0 .oldext .newext\n" unless ($ARGV[0] and $ARGV[1]);

die "Usage: $0 .oldext .newext (use the dots!)\n"
    unless ( ($ARGV[0] =~ /^\./) and ($ARGV[1] =~ /^\./) );


chdir $ENV{PWD};
#print "now in: " , `pwd`;

$oldext = $ARGV[0];
$newext = $ARGV[1];

print "Change $oldext to $newext? [Y/n]\n";

$answer = <STDIN>;
chomp $answer;

#print "answer: '$answer'\n";

exit unless ($answer eq 'Y' or $answer eq 'y' or $answer eq '');

print "Renaming files...\n";

@files = <*$oldext>;

foreach $file (@files) {
#    print "got: '$file'\n";
    $file =~ m/$oldext$/;
    $base = $`;
    my $cmd = "cp $file $base$newext";
    print $cmd, "\n";
    `$cmd`;
}

