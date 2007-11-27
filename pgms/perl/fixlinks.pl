#!/usr/bin/perl

# $Id: fixlinks.pl,v 1.3 2006/01/20 22:15:46 swain Exp $


use strict;
use warnings;
use File::Copy;

my $staticurl = '<? echo $gallery->app->static_content_server; ?>/';

chdir '/home/swain/public_html/projects/ampiradev/gallery';

open UNDOSCRIPT, "> undo.sh" or die "Cannot write undo.sh: $!\n";
open MAKECLEAN, "> clean.sh" or die "Cannot write clean.sh: $!\n";

open PIPE, 'find . -type f |grep -v CVS |' or die "Cannot open pipe: $!\n";

use vars qw($counter %php %html $phpfile);

while ($phpfile = <PIPE>) {

    next if $phpfile =~ /tests|CVS/;
    next unless $phpfile =~ /php$|default$/;

    chomp $phpfile;

    if ( 1 or $phpfile =~ m%all.header% ) {
        print STDERR "doing $phpfile\n";

        $counter = 10000;
        %php = ();
        %html = ();
        
        &backupfile($phpfile);
        &parsefile($phpfile);
    } 
    #else { print "Skipping '$phpfile'\n"; }
}




sub parsefile {
    print "Got: $_[0]\n";

    my $file;

READFILE: 
    {
        local $/ = undef;
        open INFILE, "$_[0]" or die $!;
        $file = <INFILE>;
    }


    &parse_start($file);

    my $preparse_length = length($file);
    my $postparse_length = length(join '', (values(%html), values(%php)));

    die "Char count does not match after parsing file!\n"  unless $preparse_length == $postparse_length;

    # for all %html, split each element on >. Apply the transforms,
    # then change the hash value.

    foreach my $key ( keys %html ) {

        my $needsbracket = 0;
        my $prexform = length($html{$key});
        my $stash = $html{$key};
        if ($html{$key} =~ />$/) { 
            #print STDERR "This ends with a bracket.\n"; 
            $needsbracket = 1;}

        my @lines = split />/, $html{$key};
        my $linecount = scalar(@lines);
        my @newlines =  &transform(@lines);
        $html{$key} = join '>', @newlines;

        if ($needsbracket && ( $html{$key} !~ />$/)) {
            $html{$key} .= '>';
        }

#         my $postxform = length($html{$key});
#         unless ($postxform == $prexform) {
#             print STDERR scalar(@newlines), " shoulda been: $linecount\n";
#             print STDERR $lines[$#lines], "\n";
#             print STDERR $newlines[$#newlines], "\n";
#             print STDERR "$stash\n--\n";
#             die "Here:\n$html{$key}\n";
#         }

    }


#     my $posttransform_length = length(join '', (values(%html), values(%php)));
#     die "Without changing anything, they came out different sizes: $postparse_length != $posttransform_length\n"
#         if ($postparse_length != $posttransform_length);
#     return;

    open OUTFILE, ">$_[0]" or die $!;

    foreach my $key (sort (keys %html, keys %php) ) {
        if (exists($html{$key})) {
            print OUTFILE $html{$key};
        } elsif (exists($php{$key})) {
            print OUTFILE $php{$key};
        } else {
            die "How did I get here?\n";
        }
    }
}


sub transform {

    my @lines = @_;
    #return @lines; # testing purposes

    for (my $x = 0; $x < scalar(@lines); $x++) {
        if ( $lines[$x] =~ /<img src=.?http/ ) {
            # do nothing, this image already has an absolute url
        } elsif ( $lines[$x] =~ m/(<img src=['"]?|background=["']?).*?(\.gif|\.jpg|\.css|\.js)/ ) {
            print "==>$lines[$x]\n<==\n";
            print "( matched: '$1' '$2' )\n";
            my $src = $1;
            $lines[$x] =~ s/\Q$src/$src$staticurl/ or die "Failed to do substitution on this line:\n$lines[$x]";
            $lines[$x] =~ s/\.\.//;
            $lines[$x] =~ s%//images/%/images/%; # not sure what's causing this; perhaps the previous operation.
            print "new version: $lines[$x]\n";
            print "\n\n";
        } elsif ( $lines[$x] =~ /img src=['"]?|background=["']?/ ) {
            warn "Failed to match this chunk: '$lines[$x]'";
            warn "in file: $phpfile\n";
        }

    }

    return @lines;
}


sub backupfile {
    my $file = shift;
    die "Cannot make backup without ovewriting: '$file.bak'" if -e "$file.${$}.bak";

    print UNDOSCRIPT "mv $file.${$}.bak $file;\n";
    print MAKECLEAN "rm $file.${$}.bak\n";

    copy($file, "$file.${$}.bak");
}


sub parse_start {
    my $code = shift;
    $code =~ /<\?/ or do { $html{ ++$counter } = $code; return; };
    my $chunk = $`;
    $html{ ++$counter } = $chunk;
    my $remainder = $& . $';        #';
    &parse_to_end($remainder);
}

sub parse_to_end {
    my $code = shift;
    $code =~ /\?>/ or return do { $html{ ++ $counter } = $code; return; };

    my $chunk = $` . $&;
    $php{ ++$counter } = $chunk;
    my $remainder = $';            #';
    &parse_start($remainder);
}
    

# $Log: fixlinks.pl,v $
# Revision 1.3  2006/01/20 22:15:46  swain
# I suspect the bug here was: blocks ending in > sometimes resulted in
# the last element of the array not being defined if there was no
# newline. I could go through the bother of proving this, but eh. So if
# the html chunk ended with > and after transformation it does not, we
# add it again. A kludge, but then this is just a little code
# transformer for a one off job. One might theorize that we could
# generalize this to transform the files given any set of rules (in my
# current thinking, using callback functions) but I feel sleepy and soon
# it's time to go home. Noone reads these things anyway.
#
# Revision 1.2  2006/01/18 19:08:17  swain
# Close to the final version. A few bugs occur in the Gallery codebase
# as a result of running this but they are trivial to fix. Actually I
# think only one occurs.
#
# Revision 1.1  2006/01/17 21:51:05  swain
# My initial version falls short due to PHP blocks getting in the
# way... so I wrote a recursive script to separate the two. Going to
# apply it now to this script.
#
