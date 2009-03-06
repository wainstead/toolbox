#!/opt/php5/bin/php
<?php
require_once('/opt/mpa/conf/gallery.conf');
  // /d0/tree/000/143/000143377-coretest

$userid   = "143377";
$username = "coretest";

print getAlbumPathTopLevel($userid, $username) . "\n";

function getAlbumPathTopLevel($userid, $username) {
    // pad the userid with leading zeroes
    $padded_uid = sprintf("%09d", $userid);

    return sprintf("%s/%s/%s/{$padded_uid}-{$username}",
                   MPA_USERS_ALBUMS_ROOT,       // i.e. /d0/tree
                   substr($padded_uid, 0, 3),   // i.e. 000
                   substr($padded_uid, 3, 3)    // i.e. 143
                   );
}

?>