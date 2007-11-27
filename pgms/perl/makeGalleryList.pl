#!/opt/perl5/bin/perl -w

# $Id: makeGalleryList.pl,v 1.2 2005/01/31 23:49:02 swain Exp $

# Given an input file that is a set of "Install Gallery" emails that
# are separated by ^L, which I think is the page separator character,
# print out the pathname and username separated by a tab.

open INFILE, "< $ARGV[0]" or die "Can't read input file '$ARGV[0]': $!\n";

$/ = "";

while ($email = <INFILE>) {
    my ($filesystem, $username);

    foreach (split /\n/, $email) {
        if (/FQDN/)         { (undef, $FQDN)       = split /:: /; }
        if (/Filesystem::/) { (undef, $filesystem) = split /:: /; }
        if (/username::/)   { (undef, $username  ) = split /:: /; }
    }
    die "$_\n" unless ($filesystem && $username);
    $filesystem =~ s|//|/|g;
    $filesystem =~ s|/web$||;
    print "$FQDN\t$filesystem\t$username\n";
}
