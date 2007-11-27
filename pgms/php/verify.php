<?php

// $Id: verify.php,v 1.4 2006/01/24 21:06:50 swain Exp $

if ($argc != 2) die("usage: me <username>\n");
$p = $argv[1];


require("verify-lib.php");
ensureWWWuser(); // we MUST be user 'www' to do this stuff

$failures = 0; # keep a count of errors, report them in exit($failures)
$celdir = "/mnt/cel-1/vol01";
$bobdir = '/mnt/bob-1/vol01';

$celbums = "$celdir/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/albums";
$bobbums = "$bobdir/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/albums";

confirmAlbumsDirExists($celbums, $bobbums);

glog("Album directories OK.");

$dispAlbums = listAlbumDirs($celbums);
$massAlbums = listAlbumDirs($bobbums);

if ( count($dispAlbums) != count($massAlbums) ) {
    eglog("The album counts do not match.");
    $failures++;

    $diff = array_diff($dispAlbums, $massAlbums);

    if ($diff) {
        eglog("Display albums dir has these but bob does not: " . implode(" ", $diff));
        $failures++;
    }

    $diff = array_diff($massAlbums, $dispAlbums);

    if ($diff) {
        eglog("Mass storage albums dir has these but cel does not: " . implode(" ", $diff));
        $failures++;
    }

} else {
    glog("User has the correct album layout. " . count($dispAlbums) . " albums found.");
}


// The "collection" variables have the structure:
// $thisCollection["albumname"]["filename.ext"] = /full/path/to/file.ext;

$dispCollection = getImageFiles($dispAlbums);
$massCollection = getImageFiles($massAlbums);
    
compareCollections($dispCollection, $massCollection);


// $Log: verify.php,v $
// Revision 1.4  2006/01/24 21:06:50  swain
// Moved the code that checks the user to verify-lib.php.
//
// Revision 1.3  2005/10/17 01:50:30  swain
// Moved all functions off to verify-lib.php.
//
// Revision 1.2  2005/10/16 22:14:19  swain
// Now compares files, tells us what's missing.
//
// Revision 1.1  2005/10/16 20:58:39  swain
// First version of a rewrite of verify.pl into PHP.
//

?>