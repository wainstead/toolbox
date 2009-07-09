#!/usr/bin/perl

use strict;
use warnings;

my $svnclient = '/usr/bin/env svn'; # default
if ( -e '/opt/subversion/bin/svn' ) {
    $svnclient = '/opt/subversion/bin/svn';
}


while ( my $line = <DATA> ) {
    chomp $line;
    my ($project, $tag) = split /: +/, $line;
    
    # we need to parse the output of this:
    # svn log --stop-on-copy -v https://svn.corp.myphotoalbum.com/mpa_gallery/tags/R_2009_04_28_facebook_and_whitelabeling
    my $command = "$svnclient log --stop-on-copy -v https://svn.corp.myphotoalbum.com/mpa_$project/tags/$tag";
    print "running $command ...\n";
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

    # and for our next magic trick: use the result from above to run
    # this command:
    # svn log -r 6140:HEAD -v https://svn.corp.myphotoalbum.com/mpa_gallery/trunk

    my $cmd = "$svnclient log -r $revision:HEAD -v https://svn.corp.myphotoalbum.com/mpa_$project/trunk";
    print "Running $cmd ...\n";

    open PLIPE, " $cmd | " or die "Failed to run command '$cmd': $!\n";
    my @results = <PLIPE>;
    close PLIPE;
    die unless scalar(@results);

    open OUT_FILE, "> RELEASE_NOTES.$project" or die $!;
    print OUT_FILE join('', @results);


}



# the data below is the output of the script I wrote for production:
# https://rcs.corp.myphotoalbum.com/viewvc/trunk/bin/fetchreleases.sh?root=swain&view=log

__END__
mpa_core: R_2009_06_30_code_reduction
mpa_gallery: R_2009_06_30_bugfixes_and_api_change_support
mpa_cart: R_2009_06_30_subdomain_free_coupon_support
mpa_products: R_2009_06_30_new_gifterator_products
