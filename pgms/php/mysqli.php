#!/opt/php5/bin/php
<?php

error_reporting(E_ALL & ~E_NOTICE);
$_SERVER['DOCUMENT_ROOT'] = '/opt/mpa_gallery/current/website/';

require_once('/opt/mpa/conf/gallery.conf');
$mysqli = new mysqli('torque.dev.myphotoalbum.com', MPA_MYSQL_USERNAME, MPA_MYSQL_PASSWORD, MPA_MYSQL_DB, 3309);
//$conni = mysqli_connect('torque.dev.myphotoalbum.com', MPA_MYSQL_USERNAME, MPA_MYSQL_PASSWORD, MPA_MYSQL_DB, 3309);



if (mysqli_connect_errno()) {
    printf("connection failed: %s\n", mysqli_connect_error());
    exit(1);
}

$res = $mysqli->query("select * from users");

while ($arr = $res->fetch_assoc()) {
    print "{$arr['username']}\n";
 }

print_r($dbconn);

