#!/usr/bin/perl

use strict;
use warnings;
# change all $gallery->something->something to defined constants in gallery.conf.

open ROLLOUT,  "> rollout.sh"  or die $!;
open ROLLBACK, "> rollbach.sh" or die $!;
open LOGFILE,  "> redefine.log" or die $!;

my %regexes;

$regexes{'$gallery->app->degraded_mode'}                  = 'DEGRADED_MODE';
$regexes{'$gallery->app->ffmpeg'}                         = 'FFMPEG';
$regexes{'$gallery->app->flvtool2'}                       = 'FLVTOOL2';
$regexes{'$gallery->app->image_server'}                   = 'IMAGE_SERVER';
$regexes{'$gallery->app->logins_disabled_for_some_users'} = 'PARTIAL_DISABLED_LOGINS';
$regexes{'$gallery->app->mass_storage_dir'}               = 'MASS_STORAGE_DIR';
$regexes{'$gallery->app->mencoder'}                       = 'MENCODER';
$regexes{'$gallery->app->mpa_mysql_db'}                   = 'MPA_MYSQL_DB';
$regexes{'$gallery->app->mpa_mysql_host'}                 = 'MPA_MYSQL_HOST';
$regexes{'$gallery->app->mpa_mysql_password'}             = 'MPA_MYSQL_PASSWORD';
$regexes{'$gallery->app->mpa_mysql_username'}             = 'MPA_MYSQL_USERNAME';
$regexes{'$gallery->app->partial_degraded_mode'}          = 'PARTIAL_DEGRADED_MODE';
$regexes{'$gallery->app->raw_image_server'}               = 'RAW_IMAGE_SERVER';
$regexes{'$gallery->app->service_name'}                   = 'MPA_SERVICE_NAME';
$regexes{'$gallery->app->sess_type'}                      = 'SESSION_TYPE';
$regexes{'$gallery->app->static_content_server'}          = 'MPA_STATIC_SERVER';
$regexes{'$gallery->app->user_data_root'}                 = 'USER_DATA_ROOT';
$regexes{'$gallery->service_outage'}                      = 'SERVICE_OUTAGE';
$regexes{'$gallery->service_outage_no_logins'}            = 'SERVICE_OUTAGE_NO_LOGINS';

# I later decided to put the find command outside... that is, pipe it
# in via stdin. --sw
#open PIPE, 'find . -name "*.php" |' or die $!;

my $filecount = 0;

while (my $filename = <STDIN>) {
    chomp $filename;
    my $changes = 0;

    open PHPINFILE, "< $filename" or die "Can't open '$filename': $!\n";
    open PHPOUTFILE, "> $filename.new" or die "Can't write '$filename': $!\n";
    
    while (my $line = <PHPINFILE>) {
        while (my($variable, $constant) = each(%regexes)) {
            if ($line =~ s/\Q$variable/\Q$constant/g) {
                $changes++;
                print "$filename.new:$.: $line";
                my $before  = substr($`, -2, 2);
                my $after   = substr($', 0, 2);        #');
                print LOGFILE "parsed: |$before $after|\n";
            }
        }
        print PHPOUTFILE $line;
    }
    close PHPINFILE;
    close PHPOUTFILE;

    
    
    if ($changes) {
        print LOGFILE "$changes to $filename\n";
        my @lines = `/opt/php5/bin/php -l $filename.new`;
        print ROLLOUT "mv $filename $filename.old\n"; # back up original. messy to use cvs for this, also slow.
        print ROLLOUT "mv $filename.new $filename\n";
        print ROLLBACK "mv $filename.old $filename\n";
        $filecount++;
        print LOGFILE "\n\n";
    } else {
        print LOGFILE "no changes to $filename\n";
        unlink("$filename.new");
    }

    

}


print LOGFILE "$filecount files changed.\n";
