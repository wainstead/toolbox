#!/usr/bin/perl

# $Id: expired_premiums.pl,v 1.10 2006/05/10 20:52:10 swain Exp $

use lib '/opt/mpa/lib';
require 'base-lib.pl';
require 'db-lib.pl';
require 'mail-lib.pl';
require 'provisioning-lib.pl';

use strict;
use warnings;

use File::Copy;

our $dbh  = &MysqlConnect();
our $smtp = &ConnectToMailServer();
our %users = ();
use vars qw( $username );

my $debug = 1;

my $renewal_interval_period = 60; # sixty days past club expiration

my $configphp_default_settings = join('', <DATA>); # see end of this file

&archive_unrenewed_clubs();

&demote_expired_club_members();

# as of may 10th 2006, this is a ways off still
#&archive_expired_redeemed_features();
#&disable_expired_redeemed_features();


$dbh->commit;
$dbh->disconnect;
&QuitMailServer();


##########
# end main
##########



# if the user hasn't renewed after 60 days, archive their row and delete it
sub archive_unrenewed_clubs {
    print "Archiving unrenewed clubs...\n" if $debug;
    
    my $query = "insert into prem_packages_history_arch
                 (select * from prem_packages_history 
                  where expire_date <= date_sub(date(now()), interval $renewal_interval_period day))
                  order by expire_date desc";

    $dbh->do($query) or warn $dbh->errstr;

    $query = "delete from prem_packages_history 
              where expire_date <= date_sub(date(now()), interval $renewal_interval_period day)";
    print "$query\n" if $debug;
    $dbh->do($query) or warn $dbh->errstr;

}


# if their club membership expired today:
# 1. demote them by setting them to status 1 in the users table.
# 2. back up their config file.
# 3. Then send them an email.

sub demote_expired_club_members {

    print "Demoting people whose time has come...\n" if $debug;

    my $query =
        "select username, p.* from users, prem_packages_history p 
         where userid=customer_id
         and expire_date <= date(now()) 
         and status = 4";

    print "$query\n" if $debug;
    my $sth = $dbh->prepare($query);
    $sth->execute;

    while (my $hash_ref = $sth->fetchrow_hashref) {
        $query = sprintf("update users set status=1, package_type=0 where username='%s'", $hash_ref->{username});
        print "Demotion: $query\n" if $debug;
        $dbh->do($query) or warn $dbh->errstr;

        &backup_config($hash_ref->{username});
        $username = $hash_ref->{username}; # needed for the email template
        &send_expired_club_email($hash_ref->{customer_id});
    }

}




sub archive_expired_redeemed_features {
    print "archiving redeemed features...\n";
    
    my $query = "insert into mpa_redeemed_features_arch 
                  (select * from mpa_redeemed_features where expiredate <= date(now()))";

    print "$query\n" if $debug;

    $dbh->do($query) or warn $dbh->errstr;
}




sub disable_expired_redeemed_features {

    my $query = "select * from mpa_redeemed_features where expiredate <= date(now())";
    print "$query\n" if $debug;
    my $sth = $dbh->prepare($query);
    $sth->execute;

    while (my $hash_ref = $sth->fetchrow_hashref) {
        $query = sprintf("delete from mpa_redeemed_features where id=%d", $hash_ref->{id});
        print "$query\n" if $debug;
        $dbh->do($query) or warn $dbh->errstr;
        &send_expired_feature_email($hash_ref->{userid});
    }

}




sub send_expired_club_email {
    my $userid = shift;
    die "send_mail: No userid passed in\n" unless $userid;
    my $email = &fetch_email_address($userid);
    print "Sending 'club expired' email to '$email'\n" if $debug;
    $email = 'swain@corp.fortunecity.com' if $debug;
    &SendTemplateMail($email,'MyPhotoDevel: Your club membership has expired','renewals/club_membership_expired.html');
}


sub send_expired_feature_email {
    my $userid = shift;
    die "send_mail: No userid passed in\n" unless $userid;
    my $email = &fetch_email_address($userid);
    print "Sending 'feature expired' email to '$email'\n" if $debug;
    &SendTemplateMail($email,'MyPhotoDevel: Feature expired','renewals/points_feature_expired.html');
}

sub fetch_email_address {
    my $userid = shift;
    my $query = "select email_address from users where userid=$userid";
    print "$query\n" if $debug;
    my $sth = $dbh->prepare($query);
    $sth->execute;
    my $hash_ref = $sth->fetchrow_hashref;
    return $hash_ref->{email_address};
}


sub backup_config {
    my $username = shift;
    return if (exists($users{$username}));
    my $path = &DeriveUserDirectory($username);
    if ( ! -e "$path/config.php.club" ) {
        copy("$path/config.php", "$path/config.php.club");
    }

    # As it turns out, we don't need to edit the config.php file and
    # replace the values. We can just appened the lines of PHP code to
    # reset the club-only features to their free site defaults. --SW

    open CONFIGPHP, ">> $path/config.php" 
        or die "Cannot write to '$path/config.php': $!\n";
    print CONFIGPHP $configphp_default_settings;

    $users{$username}++; # don't do them more than once!
}




# the lines below the END tag are available via the <DATA> filehandle
# (this is an old Perl feature I'm fond of). This is the PHP appended
# to the config.php file for users whose club has expired. --SW

__END__
<?
// these lines added by the cron job expired_premiums.pl
$gallery->app->skinname = "default";
$gallery->app->gallery_thumb_frame_style = "fancy2";
$gallery->app->default["album_frame"] = "white-book";
$gallery->app->default["thumb_frame"] = "polaroid";
$gallery->app->default["image_frame"] = "polaroid2";
$gallery->app->rssMode = "basic";
$gallery->app->rssEnabled = "yes";
$gallery->app->default["show_profile_tab"] = "yes";
$gallery->app->default["show_hotvideos_tab"] = "yes";
$gallery->app->default["print_photos"]["myphotoalbum"]["checked"] = "checked";
?>
