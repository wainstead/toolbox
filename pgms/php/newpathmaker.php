#!/opt/php5/bin/php
<?php

  // /d0/tree/000/143/000143377-coretest

$userid   = "143377";
$username = "coretest";

getAlbumPath($userid);

function getAlbumPath($userid) {
    $padded_uid = sprintf("%09d", $userid);
    $threesome  = substr($padded_uid, 0, 3);
    $sixsome    = substr($padded_uid, 3, 3);
    print "padded: $padded_uid\n";
    print "first three: $threesome\n";
    print "second: $sixsome\n";
    print "sized monty: /d0/tree/$threesome/$sixsome/{$padded_uid}-{$username}\n";
    print "full monty: /d0/tree/$threesome/$sixsome/{$padded_uid}-{$username}-B\n";
}
?>