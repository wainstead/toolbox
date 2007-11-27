#!/opt/php5/bin/php
<?php

// $Id: test_stored_procedures.php,v 1.1 2007/03/02 17:03:19 swain Exp $

// first create the stored procedure:
// create procedure test_proc() reads sql data select username from users where username like 'sw%';
// grant execute on procedure mpa.test_proc to mpauser;


error_reporting(E_ERROR & ~E_WARNING);

require("/opt/mpa/conf/gallery.conf");

$mysqli = new mysqli( 'spork.dev.fortunecity.com',
                    $gallery->app->mpa_mysql_username,
                    $gallery->app->mpa_mysql_password,
                    $gallery->app->mpa_mysql_db,
                    3309
                    );

if (mysqli_connect_errno()) {
    printf("connection failed: %s\n", mysqli_connect_error());
    exit(1);
}

$query = "call test_proc()";

echo("query:\n# $query\n");

$results = $mysqli->query( $query );

try {
    if (!$results) throw new Exception("Query failed");

    if ($mysqli->errno <> 0) {
        printf("query failed: %s\n", $mysqli->error);
    }

    while ( $row = $results->fetch_object() ) {
        printf("username: %s\n", $row->username);
    }

} catch (Exception $e) {
    echo 'Caught exception: ', $e->getMessage(), "\n";
}

?>
