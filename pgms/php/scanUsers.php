#!/opt/php4/bin/php
<?php

// $Id: scanUsers.php,v 1.8 2005/05/12 23:11:08 swain Exp $

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
$query = "select username from users where status > 0 and last_updated != '0000-00-00 00:00:00'";
//$query = "select username from users where username='swain'";
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

    // authorize us as the admin
    $tmpUser = $gallery->userDB->getUserByUsername('admin');
    $tmpUser->log("login");
    $tmpUser->save();
    $gallery->session->username = 'admin';
    $gallery->user = $tmpUser;

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
    //if ($album->isLoaded()) echo "YeS!\n"; else echo "NIEN\n"; // it is loaded
    //echo serialize($album) . "\n";
    echo "album name: " . $album->fields["name"] . "\n";
    $albumname = $album->fields["name"];
    $numItems = $album->numPhotos(1);
    //echo "------------------ >number of pix: $numItems\n";

    for ($k = 0; $k < $numItems; $k++) {
        //echo "index: $k+1\n";
        $albumitem = $album->getPhoto($k + 1);
        $id = $album->getPhotoId($k + 1);
        //if ( is_object($albumitem) && isset($albumitem->name) ) {
        //if ( is_object($albumitem) && !$albumitem->getIsAlbumName() ) {
        if ( $albumitem->image ) {
            //echo serialize($albumitem) . "\n\n";
            //echo "typeof: " . gettype($albumitem) . "\n";
            $filesize =  $albumitem->getFileSize(1);
            $uploaded = $albumitem->uploadDate;
            $uploaded = date('Y-m-d h:m:s', $uploaded);
            echo "values( '$p', '$albumname', '$id', '$uploaded', $filesize)\n";
        } else {
            echo "this albumitem was not an image:\n";
            /*
            $class = get_class($albumitem);
            $parent = get_parent_class($albumitem);
            if (is_a($albumitem, "Image")) {
                echo "This is an Image object.\n";
            } else {
                echo "This is NOT an Image object.\n";
            }
            */
            //echo "------------------------------>>>>>'$p', '$albumname', '$id', type '$class', '$parent'\n";
            //echo serialize($albumitem) . "\n\n";
            
            $myAlbum = new Album();
            //$myAlbum->load($albumitem->fields["name"]);
            $myAlbum->load( $album->isAlbumName($k + 1) );
            //echo serialize($myAlbum) . "\n";
            
            echo "...........recursing...\n";
            explodeLP($myAlbum, $p);
            echo "___________decursed!\n";
        }
    }
}
    


/*
 * $Log: scanUsers.php,v $
 * Revision 1.8  2005/05/12 23:11:08  swain
 * Solved the recursion problem. Format is now correct for SQL inserts; a
 * little more cleanup and it's ready.
 *
 * Revision 1.7  2005/05/11 21:23:13  swain
 * Solved the problem with getting the "id" of the photo; $gallery->album
 * was not defined.
 *
 * Revision 1.6  2005/05/06 23:40:25  swain
 * Now fetches all albumitems and the upload date. All that remains is to
 * get the file size and format the upload date in datetime format.
 *
 * Revision 1.5  2005/05/06 22:37:41  swain
 * Moving to bork.
 *
 * Revision 1.4  2005/05/06 22:23:07  swain
 * Added admin user. We were running as everybody user before.
 *
 * Revision 1.3  2005/05/06 22:13:52  swain
 * Added exec() to trap errors in broken PHP files. Unfortunately eval()
 * will not work.
 *
 * Revision 1.2  2005/04/27 21:59:52  swain
 * Improved output; skips sites without photos or albums; etc
 *
 * Revision 1.1  2005/04/27 21:53:16  swain
 * First working version that scans all user's web sites from the command line.
 *
 */

?>