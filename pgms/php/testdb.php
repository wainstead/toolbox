#!/opt/php4/bin/php
<?php

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




$_MPA_CONF = mpaParseConf(); // mysql connection info


// connect to database
$conn = mysql_pconnect($_MPA_CONF['mysql_host'] 
                       . ':' 
                       . $_MPA_CONF['mysql_port'], $_MPA_CONF['mysql_user'], $_MPA_CONF['mysql_password']);


if ( ! $conn) {
    exit(1);
}

if ( !  mysql_ping($conn) ){
    exit(1);
}


exit(0);


?>