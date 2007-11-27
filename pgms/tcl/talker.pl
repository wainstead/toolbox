#!/usr/bin/perl


$SIG{ALRM} = \&timed_out;


$pause = $ARGV[0];
$word  = $ARGV[1];

die unless $pause;

$countdown = $pause;

while ($countdown > 0) {
    eval {

        alarm($pause);

        $command = <STDIN>;
        chomp $command;

        if ($command =~ /exit/) {
            exit(0);
        } else {
            print "got '$command'\n";
            alarm(0);
        }
    };

    $countdown--;
    if ($@) { print "$countdown! $word! $@"; }


}

sub timed_out {
    die "cycling!\n";
}
