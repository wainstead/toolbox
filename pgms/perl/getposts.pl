#!/opt/perl5/bin/perl

push(@INC,"/opt/mbs/lib");

require("base-lib.pl");
require("db-lib.pl");

use RPC::XML::Client;

use warnings;
use vars qw( %posters $metaweblog_api_url $dbh $count );

unless ( defined($ARGV[0]) ) {
    die "Usage: $0 character, where character is the first letter(s) of the usernames you wanna do.\n";
}

my $char = $ARGV[0];

&MysqlConnect();


$sth = $dbh->prepare("select blogware_id, username, password, date_confirmed from users where status=1 and username like '$char%'");
$sth->execute();


while (my @arr = $sth->fetchrow_array) {
    #print "$arr[0] $arr[1] $arr[2]\n";
    push @users, \@arr;
    #last if $count++ > 200;
}

$sth->finish;

&MysqlDisconnect();

open LOG, "> ./bloglogs/$char.log" or die $!;

print LOG "no. posts\tusername\tid\turl\tdate confirmed\tlast title\tlast post date\n";

foreach $a (@users) {

    #print "$$a[0] $$a[1] $$a[2]\n";

    my ($blog_id,$username,$password, $date_confirmed) = @{$a};

    eval {


        my $client = RPC::XML::Client->new($metaweblog_api_url);

        my $req =	RPC::XML::request->new('metaWeblog.getRecentPosts',
                                               RPC::XML::int->new($blog_id),
                                               RPC::XML::string->new($username),
                                               RPC::XML::string->new($password),
                                               RPC::XML::int->new(600)); # this number determines how many to return

        my $res = $client->send_request($req);

        undef $client;

        if (ref($res)) {

            my $arref = $res->value;

            if (ref($arref) eq 'ARRAY') {
                #print STDERR "pretest count for $username: " . scalar(@{$arref}) . "\n";
                my $posts = scalar(@{$arref});


                my $lastpostdate = $arref->[0]->{dateCreated} || '';
                my $lasttitle = $arref->[0]->{title} || '';

                print STDERR "$posts http://$username.myblogsite.com/\n";
                print LOG "$posts\t$username\t$blog_id\thttp://$username.myblogsite.com/\t$date_confirmed\t$lasttitle\t$lastpostdate\n";
                
            }

        } else {
            # changed password maybe?
            my $str = ref($res);
            print STDERR "No result for $blog_id, $username, $password (got '$res' back, '$str')\n";
        }
    };

    if ($@) {
        warn "WARNING: RPC::XML eval call returned something: '$@'\n";
    }

    #last if $count++ > 100;

} # end foreach @users

#print "<h2>";
#print scalar(@users), " have activated accounts.</h2>\n";
#print "<h2>", scalar(keys %posters), " have posted 2 or more times.</h2>\n";
#print "Sites with 10 or more posts:<p>";
# print "<table border=1>\n";
# print "<tr><th>number posts</th><th>site</th><th>date activated</th><th>Title of last post</th><th>Date of last post</th></tr>\n";

# foreach my $poster ( sort { $posters{$b} <=> $posters{$a} } keys %posters) {
#     print "$poster\n";
# }

# print "</table>\n";


# $Log: getposts.pl,v $
# Revision 1.4  2005/08/21 13:57:11  swain
# Updated to take a command line argument. Call this with fork.pl.
#
# Revision 1.3  2005/08/18 20:57:11  swain
# Added cvs log history.
#

# revision 1.2
# date: 2005/05/03 15:37:23;  author: swain;  state: Exp;  lines: +13 -10
# Changed: only gets the last 3 messages for the user. The goal here was
# to measure how many people are not using the thing. (Count was 23,000
# activations, but 15,000 had not used the thing.)
# ----------------------------
# revision 1.1
# date: 2005/04/28 19:59:44;  author: swain;  state: Exp;
# First version of a script that tells us how many posts per mbs user.

