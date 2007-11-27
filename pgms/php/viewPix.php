#!/opt/php4/bin/php
<?php

// $Id: viewPix.php,v 1.1 2005/06/06 14:59:36 swain Exp $

require("/opt/mpa/conf/gallery.mysql.conf");

$GALLERY_BASEDIR = "/mnt/cel-1/vol01/linkless/gallery/";
//$GALLERY_BASEDIR = "/home/swain/public_html/projects/ampiradev/gallery/";
$USER_ROOT = "/mnt/cel-1/vol01";

$_SERVER['MPA_GALLERY_ROOT'] = '/mnt/cel-1/vol01';

chdir($GALLERY_BASEDIR);


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
//$query = "select username from users where status > 0 and last_updated != '0000-00-00 00:00:00'";
$query = "select username from users where username='swain'";
//stderr("MPA query: " . $query);

// execute query
$res = mysql_query($query, $conn);

$users = array();

while ($row = mysql_fetch_array($res)) {
    array_push($users, $row[0]);
}

reset($users);

$totalAlbums = 0;
$totalPhotos = 0;

for ($x = 0; $x < count($users); $x++) {
    
    $p = $users[$x];
    //echo "------------> $p\n";
    $GALLERY_USERDIR = "$USER_ROOT/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/";

    if (! file_exists($GALLERY_USERDIR . "config.php")) {
        echo "$p does not have a config.php file.\n";
        continue;
    }

    $mixed = exec("/opt/php4/bin/php -l $GALLERY_USERDIR" . "config.php", $output, $retval);
    if ($retval != 0) {
        echo "$p has a broken config.php file.\n";
        continue;
    }

    $_SERVER['HTTP_HOST'] = "$p.myphotodevel.com";
    require_once($GALLERY_BASEDIR . "init.php");
    require($GALLERY_USERDIR . "config.php");


    //    if (!isset($gallery->user)) {
    if (false) {
        $gallery->user = $gallery->userDB->getEverybody();
        $gallery->session->username = "";
    } else { 
        // authorize us as the admin
        $tmpUser = $gallery->userDB->getUserByUsername('crusoe');
        $tmpUser->log("login");
        $tmpUser->save();
        $gallery->session->username = 'admin';
        $gallery->user = $tmpUser;
    }

    //echo serialize($gallery->user);

    $albumDB = new AlbumDB(FALSE);
    $gallery->session->albumName = "";
    $page = 1;

    $numAlbums = $albumDB->numAlbums($gallery->user);

    for ($i = 0; $i < $numAlbums; $i++) {
        //echo "here: " . $gallery->app->albumDir . "\n";
        $album = $albumDB->getAlbum($gallery->user, $i + 1);
        if ( ! is_object($album) ) {
            echo "Could not get the album on index $i!!!\n";
            continue;
        }

        explodeLP($album, $p);

        /*
        $ids = $album->getIds(1);
        $idcount = count($ids);
        for ($k = 0; $k < $idcount; $k++) {
            $photoid = $ids[$k];
            echo $ids[$k] . "\n";
            // http://swain.myphotodevel.com/view_photo.php?set_albumName=album02&id=P6070042_JPG
            //echo "http://$p.myphotodevel.com/view_photo.php?set_albumName=$albumname&id=$photoid\n";
        }
        */
    }

    $numPhotos = $albumDB->getCachedNumPhotos($gallery->user);
    //echo "number of albums: $numAlbums\n";
    //echo "number of photos: $numPhotos\n";
    echo "$p\t$numAlbums\t$numPhotos\n";
    $totalAlbums += $numAlbums;
    $totalPhotos += $numPhotos;

    if ($totalAlbums > 100) { break; }
}

echo "total albums: $totalAlbums\n";
echo "total photos: $totalPhotos\n";


    
function explodeLP($album, $p) {

    global $gallery;

    $gallery->album = $album;
    //if ($album->isLoaded()) echo "Yes!\n"; else echo "NIEN\n"; // it is loaded
    //echo serialize($album) . "\n";
    echo "album name: " . $album->fields["name"] . "\n";
    $albumname = $album->fields["name"];
    $numItems = $album->numPhotos(1);

    $j = 1; // start counting from one, as is Gallery's lot, the devil take them all


    echo "first loop through the gallery way\n";
    echo "##################\n";
    while ($j < $numItems) {
        $albumitem = $album->getPhoto($j);
        $id = $album->getPhotoId($j);
        echo "$j: $id ";

        if ($albumitem->image)
            ;
        else
            echo " is not an image. ";
        $j = getNextPhoto($j);
    }
    echo "\n";

    //echo "------------------ >number of pix: $numItems\n";
    /*
    echo "now loop through brute force approach\n";
    for ($k = 0; $k < $numItems; $k++) {

        $kplus = $k + 1;
        $albumitem = $album->getPhoto($kplus);
        $id = $album->getPhotoId($kplus);

        if ( $albumitem->image ) {
            echo "$kplus: $id ";
        } else {
            echo "\nalbumitem $kplus was not an image. recursing.\n";
            $myAlbum = new Album();

            $myAlbum->load( $album->isAlbumName($k + 1) );
            explodeLP($myAlbum, $p);
            echo "___________decursed!\n";
        }
    }
    */
    echo "\n";
}
    


/*
 * $Log: viewPix.php,v $
 * Revision 1.1  2005/06/06 14:59:36  swain
 * Testbed for getting a list of all images in a single album that a user
 * is allowed to view. Subalbums are not included.
 *
 */

?>