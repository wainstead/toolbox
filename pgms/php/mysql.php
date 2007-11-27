#!/opt/php4/bin/php
<?php


//$gallery->app->evwusername = "portman";

$gallery->app->evwusername = "swaintestoct1";


stderr( mpaUpdateLastUpdated() );


/** 
 * Update the table 'users' in the MPA database, setting the
 * 'last_updated' field to the current time.
 */

function mpaUpdateLastUpdated() {

    global $gallery; // from where we get the username
    $_MPA_CONF = mpaParseConf(); // mysql connection info

    $username = $gallery->app->evwusername;

    // connect to database
    $conn = mysql_pconnect($_MPA_CONF['mysql_host'] 
                           . ':' 
                           . $_MPA_CONF['mysql_port'], $_MPA_CONF['mysql_user'], $_MPA_CONF['mysql_password']);

    if (! $conn) {
        stderr("MPA: Failed to connect to mysql.");
        return false;
    }

    if (! mysql_select_db($_MPA_CONF['mysql_database'], $conn) ) {
        stderr("MPA: Failed to select mpa database.\n");
        return false;
    }

    // create timestamp
    $now = strftime('%Y-%m-%d %H:%M:%S');
    
    // build query
    $query = "update users set last_updated='$now' where username='$username'";
    
    // execute query
    $res = mysql_query($query, $conn);

    // check for success, return true if yes
    if (! $res) {
        stderr("MPA: Failed to update the database (query returned 'false' for user '$username')\n");
        return false;
    } elseif (mysql_affected_rows($conn) == 0) {
        stderr("MPA: Failed to update the database (got 'no rows affected' for user '$username')\n");
        return false;
    } else {
        return true;
    }
}

/*
 * parse the key/value file mpa.conf. This file consists of lines in the form of:
 * key = value
 * all lines not conforming to this are ignored.
*/
function mpaParseConf() {
    // parse the mpa conf file
    $mpa_conf_file = '/opt/mpa/conf/mpa.conf';
    
    $conf_lines = file($mpa_conf_file);

    if (! $conf_lines) {
        stderr("Failed to parse the conf file.\n");
        return false;
    }

    $_MPA_CONF = array();

    $array_length = count($conf_lines);

    // build an associative array of key/value pairs
    for ($x = 0; $x < $array_length; $x++) {
        if (preg_match("/^\/\/|^#/", $conf_lines[$x]) == 1) {
            continue;
        }

        if (! preg_match("/=/", $conf_lines[$x])) {
            continue;
        }
        
        $keyval = preg_split("/\s*=\s*/", $conf_lines[$x], 2);

        if (count($keyval) != 2) {
            continue;
        }

        $_MPA_CONF[$keyval[0]] = trim($keyval[1]);
        
    }

    return $_MPA_CONF;
}

// print to stderr (that is, to error_log if this runs under Apache)
function stderr($message) {
    $stderr = fopen('php://stderr', 'w');
    fwrite($stderr, $message);
    fclose($stderr);
}


?>