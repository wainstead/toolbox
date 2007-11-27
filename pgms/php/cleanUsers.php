#!/opt/php4/bin/php
<?php

// $Id: cleanUsers.php,v 1.2 2005/12/28 21:54:53 swain Exp $
// upgrade ppl to club

require("/opt/mpa/conf/gallery.mysql.conf");

//$_MPA_CONF = mpaParseConf(); // mysql connection info

$userroot = $gallery->app->user_data_root;

$conn = mysql_pconnect($gallery->app->mpa_mysql_host,
                       $gallery->app->mpa_mysql_username,
                       $gallery->app->mpa_mysql_password);

if (! $conn) {
    echo("MPA: Failed to connect to mysql.");
}

if (! mysql_select_db($gallery->app->mpa_mysql_db, $conn) ) {
    echo("MPA: Failed to select mpa database.\n");
}


// build query
$query = "select username from users";
//stderr("MPA query: " . $query);

// execute query
$res = mysql_query($query, $conn);

$users = array();

while ($row = mysql_fetch_array($res)) {
    array_push($users, $row[0]);
}

reset($users);
for ($x = 0; $x < count($users); $x++) {
    //echo "$users[$x]\n";
    $p = $users[$x];
    $GALLERY_USERDIR = "$userroot/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/";
    if (file_exists($GALLERY_USERDIR)) {
        echo "-- $p exists\n";
    } else {
        echo "-- $p does not exist.\n";
        //echo "delete from users where username='$p';\n";
        system("/opt/mpa/admin/unix-bin/removeaccount.pl  $p 'deleted by swain'");

    }
}

?>