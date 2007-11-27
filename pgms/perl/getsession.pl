#!/usr/bin/perl -w 

# you can find the session key you need by using the fgrep form of grep:
# grep --before-context=5 --after-context=5 mpa_die osc.log

die "Usage: $0 <session key> <logfile>\n" unless $ARGV[0];
if ($ARGV[1]) {
    open LOG, "< $ARGV[1]" or die "Cannot open logfile '$ARGV[1]': $!\n";
} else {
    # use magic
    print "Reading log from stdin...\n";
    *LOG = *STDIN;
}

$flag     = 0;
@minilist = ('first', 'second');

while (<LOG>) {

    # first, scroll down to the first occurance of our session key
    # we save the last four lines because I say so
    if ($flag == 0) {

        if ($_ =~ /^$ARGV[0]/) {
            $flag = 1;
            push @lines, @minilist;
        } else {
            if (scalar(@minilist) > 4) {
                shift @minilist;
            }
            push @minilist, $_;

        }
        next;
    }
    
    push @lines, $_;

}
if ( ! scalar(@lines) ) {
    die "Your session key ('$ARGV[0]') was not found in the log.\n";
}

$linenum = $#lines;

# find the last occurrence of our session key, counting backwards
# through the array of lines from the log
while ( $linenum > 0 ) {
    last if ($lines[$linenum] =~ /^$ARGV[0]/);
    $linenum--;
}


for ($x = 0; $x <= $linenum; $x++) {
    print $lines[$x];
}
