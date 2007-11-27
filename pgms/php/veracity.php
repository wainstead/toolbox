#!/opt/php4/bin/php
<?php

// $Id: veracity.php,v 1.34 2006/10/24 21:07:05 swain Exp $

if ($argc == 2) {
    if ($argv[1] == 'purge_deleted_photos')  {
        $query = "SELECT distinct(username) FROM mpa_albumitems WHERE status='D'";
    } else {
        $query = "SELECT username 
                  FROM users
                  WHERE status > 0
                  AND last_updated != '0000-00-00 00:00:00' 
                  AND username regexp '^{$argv[1]}' 
                  ORDER BY username";
    }

} elseif ($argc == 3) {
    // normal query for normal runs
    $firstthree  = $argv[1];
    $secondthree = $argv[2];

    $query = "SELECT username
              FROM users
              WHERE status > 0
              AND last_updated != '0000-00-00 00:00:00' 
              AND left(username, 3) >= '$firstthree' 
              AND left(username, 3) <= '$secondthree'";
} else {
    print "usage: $argv[0] username\$, or:\n";
    print "       $argv[0] regexp, or:\n";
    print "       $argv[0] [first three chars] [second three chars], or\n";
    print "       $argv[0] 'purge_deleted_photos'\n";
    exit(42);
}





$debug = false; // dumps the four key data structures. Massive output.

ob_start();
error_reporting(E_ERROR & ~E_WARNING);

// we now have a catch 22: service name is defined in the conf file,
// so I kludge it thusly.
$_SERVER['HTTP_HOST'] = sprintf("%s.%s", $firstthree, "service.name");


require("./verify-lib.php");
require("/opt/mpa/conf/gallery.mysql.conf");




// we MUST be user 'www' 
ensureWWWuser();

$GALLERY_BASEDIR = "/mnt/cel-1/vol01/linkless/gallery/";
//$GALLERY_BASEDIR = "/home/swain/public_html/projects/ampiradev/gallery/";
$FASTSTORAGE = "/mnt/cel-1/vol01";


// Gallery expects to find this server variable, which is set in httpd.conf
$_SERVER['MPA_GALLERY_ROOT'] = $gallery->app->user_data_root;

chdir($GALLERY_BASEDIR); // fake the DocumentRoot

// We still use mysql sessions even from the command line. A script
// will just silently fail if it cannot access the sessions db, it
// seems.

$conn = mysql_connect($gallery->app->mpa_mysql_host,
                      $gallery->app->mpa_mysql_username,
                      $gallery->app->mpa_mysql_password);

if (! $conn) {
    eglog("MPA: Failed to connect to mysql.");
}

if (! mysql_select_db($gallery->app->mpa_mysql_db, $conn) ) {
    eglog("MPA: Failed to select mpa database.\n");
}

glog("query:\n# $query");

$query_res = mysql_query( $query, $conn );


// for each username...
while ( $row = mysql_fetch_array($query_res) ) {
    
    $p = $row[0]; // $p is a carryover from the crack pages, in case you've ever wondered.
    glog("===============================================================");


    $_SERVER['HTTP_HOST'] = sprintf("%s.%s", $p, $gallery->app->service_name);
    unset($gallery->app->subdomain);

    // gallery display and fullsized collections; file system display and
    // full sized collections. 'mass' as in 'mass storage'.
    $g_disp_collection  = array();
    $g_mass_collection  = array();
    $fs_disp_collection = array();
    $fs_mass_collection = array();


    $depth = 0; // protect against infinite recursion

    $GALLERY_USERDIR = 
        "$FASTSTORAGE/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/";

    //echo "using $GALLERY_USERDIR.\n";

    /* rule one: user must have a config.php and it must be lint free. */

    if (! file_exists($GALLERY_USERDIR . "config.php")) {
        glog( "$p does not have a config.php file.\n($GALLERY_USERDIR/config.php)\n");
        //exit(1);
        continue;
    }

    $mixed = exec("/opt/php4/bin/php -l $GALLERY_USERDIR" . "config.php", $output, $retval);
    // lint check doesn't catch zero byte files
    $configsize = @filesize($GALLERY_USERDIR . "config.php");

    if ( ($retval != 0) || ($configsize == 0) ) {
        glog( "$p has a broken config.php file.\n");
        // no time like the present
        $mixed = exec("/opt/mpa/admin/unix-bin/regenConfig.pl -u $p", $output, $retval);
        if ($retval != 0) {
            eglog("Failed to regenerate the config file for user '$p'\n");
            continue;
        } else {
            glog("Fixed broken config file.");
        }
    }



    require_once($GALLERY_BASEDIR . "init.php");
    require($GALLERY_USERDIR . "config.php");
    require($GALLERY_USERDIR . "user.local.php");
    //echo "photo album url: " . $gallery->app->photoAlbumURL . "\n";

    // assert we have loaded this user's data
    if ( ! preg_match( "/$p/", $gallery->app->albumDirURL) ) 
        die("Failed to load the config data for '$p': " 
            . $gallery->app->albumDirURL 
            . "\n");
    

    ob_flush();

    /* rule two: admin user must exist. Users used to be able to change
       the name of the admin user, breaking things. */

    // authorize us as the admin
    $tmpUser = $gallery->userDB->getUserByUsername('admin');
    if (! isset($tmpUser) ) {
        glog( "No admin user for this site.");
        //exit(3);
        continue;
    }

    //glog( "Admin loaded.\n");

    $tmpUser->log("login");
    $tmpUser->save();
    $gallery->session->username = 'admin';
    $gallery->user = $tmpUser;


    /* rule three: make sure we have equal album names in both cel-1 and bob-1 */

    // We have to build the filesystem snapshot first, because when we
    // build the Gallery snapshot, $album->save is called, which will
    // create an empty directory if none exists. We will not catch
    // this bug then.

    glog("Building filesystem snapshot.");
    $failures = getFileSystemSnapshot($fs_disp_collection, $fs_mass_collection);

    if ($failures > 0) {
        glog("ERRORS: There were $failures failures when reading the albums and images from the filesystem for $p.");
        glog("Giving up on $p and continuing.");
        continue;
    }

    if ( count($fs_disp_collection) == 0 && count($fs_mass_collection) == 0 )
        glog("No albums on the filesystem.");
    
    if ($debug) renderCollectionAsText($fs_disp_collection);
    if ($debug) renderCollectionAsText($fs_mass_collection);


    // build the Gallery snapshot, i.e. how Gallery sees it

    $albumDB = new AlbumDB();
    $gallery->session->albumName = "";
    $page = 1;
    $album_nc = array(); // album name cache, to prevent visting nested albums twice

    $numAlbums = count($albumDB->albumList);
    $numAccess = $albumDB->numAccessibleAlbums($gallery->user);
    if ($numAlbums == 0) {
        glog("No albums listed by Gallery.");
    }
    //glog( "Number of albums in this site: $numAlbums");
    //glog( "Number of accessible (?) albums: $numAccess");
    
    //glog("Building snapshop via Gallery.");

    foreach ($albumDB->albumList as $album) {

        //glog( "veracity: Album name: " . $album->fields['name'] );

        if ( ! is_object($album) ) {
            glog( "Could not get the album on index $i!!!");
            continue;
        }

        explodeLP($album, $p, $g_disp_collection, $g_mass_collection);
    }

    // assert that we visited every available album
    if ( $numAlbums != count($album_nc) ) {
        eglog("ERROR: did not visit every album. numAlbums != count(album_nc).");
        continue;
    }

    glog( "done building gallery collections");
    glog("Sizes: g_disp " . count($g_disp_collection) . " g_mass " . count($g_mass_collection) . "\n");

    if ($debug) renderCollectionAsText($g_disp_collection);
    if ($debug) renderCollectionAsText($g_mass_collection);



    /////// the collections are now created.



    // the function compareCollections only maps full sized images to
    // sized and thumbs within either Gallery or the filesystem; it
    // does not compare Gallery's collections to the
    // filesystem's. (Clearly this is inadequate).

    //glog("comparing 'g' collections.");
    $res = compareCollections($g_disp_collection, $g_mass_collection);
    if ($res > 0)
        glog("There were $res failures in the g collections.");

    //glog("comparing 'fs' collections.");
    $res = compareCollections($fs_disp_collection, $fs_mass_collection);
    if ($res > 0)
        glog("There were $res failures in the fs collections.");

    /*
    // this only compares albums
    $keydiff = array_diff($g_disp_collection, $fs_disp_collection);
    glog("keydiff: " . count($keydiff) . " (difference in keys, gdisp and fsdisp)");

    $keydiff = array_diff($g_mass_collection, $fs_mass_collection);
    glog("fullsized keydiff: " . count($keydiff) . " (difference in keys, gmass and fsmass)");
    */
 
    // find dark matter
    $delete_matter = false; // set this to toggle deleting dark matter
    $darkmatter = 0;
    foreach ($fs_mass_collection as $albumname => $file_array) {
        foreach ($file_array as $filename => $filepath) {
            if ( ! isset($g_mass_collection[$albumname][$filename]) ) {
                if ( ! file_exists($filepath) ) die("ERROR: file does not exist! '$filepath'");
                glog("dark matter (large): $filepath\n");
                if ( $delete_matter )
                    if ( ! unlink($filepath) ) eglog("failed to unlink '$filepath'");
            }
        }
    }

    foreach ($fs_disp_collection as $albumname => $file_array) {
        foreach ($file_array as $filename => $filepath) {
            if ( ! isset($g_disp_collection[$albumname][$filename]) ) {
                if ( ! file_exists($filepath) ) die("ERROR: file does not exist! '$filepath'");
                glog("dark matter (display): $filepath\n");
                if ( $delete_matter )
                    if ( ! unlink($filepath) ) eglog("failed to unlink '$filepath'");
            }
        }
    }

    
    // find dark energy (gallery has it, filesystem does not)
    foreach ($g_mass_collection as $albumname => $file_array) {
        foreach ($file_array as $filename => $filepath) {
            if ( ! isset($fs_mass_collection[$albumname][$filename]) ) {
                if ( file_exists($filepath) ) eglog("ERROR: large file exists! '$filepath'\n");
                glog("dark energy : $filepath");
            }
        }
    }

    // find dark energy (gallery has it, filesystem does not)
    foreach ($g_disp_collection as $albumname => $file_array) {
        foreach ($file_array as $filename => $filepath) {
            if ( ! isset($fs_disp_collection[$albumname][$filename]) ) {
                if ( file_exists($filepath) ) eglog("ERROR: display file exists! '$filepath'\n");
                glog("dark energy: $filepath");
            }
        }
    }


}

//add a new rule: if an album has photos, it must have a highlight.


?>