#!/opt/php5/bin/php
<?php

$conn = @mysql_connect('localhost', 'mysql_user', 'mysql_password');
if (!$conn) {
    die("No dice man: " . mysql_error());
}

?>