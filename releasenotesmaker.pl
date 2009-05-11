#!/usr/bin/perl

if ( -e '/opt/subversion/bin/svn' ) {
    $svnclient = '/opt/subversion/bin/svn';
} else {
    $svnclient = '/usr/bin/env svn';
}


while ( my $line = <DATA> ) {
    chomp $line;
    my ($project, $tag) = split /: +/, $line;
    
    # we need to parse the output of this:
    # svn log --stop-on-copy -v https://svn.corp.myphotoalbum.com/mpa_gallery/tags/R_2009_04_28_facebook_and_whitelabeling
    my $command = "$svnclient log --stop-on-copy -v https://svn.corp.myphotoalbum.com/mpa_$project/tags/$tag";
    #print "command: $command\n";
    open POPE, "$command | " or die "Can't open pipe for command '': $!\n";
    my $revision = 0;
    while ( my $result = <POPE> ) {
        #print $result;
        if ($result =~ /^r(\d+)/) {
            # the last log entry will be Bill's when he branched; so
            # the last match is the correct one.
            $revision = $1;
        }
    }

    #print "==> $project: $revision\n";
}


__END__
cart:     R_2009_04_28_shared_sessions
core:     R_2009_04_28_expanded_classlib
gallery:  R_2009_04_28_facebook_and_whitelabeling
products: R_2009_04_28_minor_release
