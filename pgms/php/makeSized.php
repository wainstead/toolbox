#!/opt/php4/bin/php
<?php

// $Id: makeSized.php,v 1.7 2005/10/10 13:52:28 swain Exp $


// usage: this script and a valid username.

if ($argc != 2) die("usage: me <initial string>\n");
$letter = $argv[1];


// we MUST be user 'www' 

if ( getenv('USER') != 'www' ) {
    echo "You must be user 'www' to run this script, or else you will "
        . "change ownership of key files in the gallery sites and break them.\n";
    exit(1);
}

require("/opt/mpa/conf/gallery.mysql.conf");


$GALLERY_BASEDIR = "/mnt/cel-1/vol01/linkless/gallery/";
//$GALLERY_BASEDIR = "/home/swain/public_html/projects/ampiradev/gallery/";
$USER_ROOT = "/mnt/cel-1/vol01";


// Gallery expects to find this server variable, which is set in httpd.conf
$_SERVER['MPA_GALLERY_ROOT'] = $gallery->app->user_data_root;

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
$query = "select username from users where status > 0 and last_updated != '0000-00-00 00:00:00' and username regexp '^$letter' order by username";
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
    if (function_exists("stderr")) {
        stderr($p);
    }


    $depth = 0; // protect against infinite recursion
    $GALLERY_USERDIR = "$USER_ROOT/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/";

    if (! file_exists($GALLERY_USERDIR . "config.php")) {
        echo "$p does not have a config.php file.\n($GALLERY_USERDIR/config.php)\n";
        continue;
    }

    $mixed = exec("/opt/php4/bin/php -l $GALLERY_USERDIR" . "config.php", $output, $retval);
    if ($retval != 0) {
        echo "$p has a broken config.php file.\n";
        continue;
    }

    $_SERVER['HTTP_HOST'] = "$p.myphotoalbum.com";
    require_once($GALLERY_BASEDIR . "init.php");
    require($GALLERY_USERDIR . "config.php");
    echo "site ------------> $p\n";

    //    if (!isset($gallery->user)) {
    if (false) {
        $gallery->user = $gallery->userDB->getEverybody();
        $gallery->session->username = "";
    } else { 
        // authorize us as the admin
        $tmpUser = $gallery->userDB->getUserByUsername('admin');
        if (! isset($tmpUser) ) {
            echo "No admin user for this site. Continuing.";
            continue;
        }
        $tmpUser->log("login");
        $tmpUser->save();
        $gallery->session->username = 'admin';
        $gallery->user = $tmpUser;
    }

    //echo serialize($gallery->user);

    $albumDB = new AlbumDB();
    $gallery->session->albumName = "";
    $page = 1;

    //$numAlbums = $albumDB->numAlbums($gallery->user);
    $numAlbums = count($albumDB->albumList);
    $numAccess = $albumDB->numAccessibleAlbums($gallery->user);
    echo "Number of albums in this site: $numAlbums\n";
    echo "Number of accessible (?) albums: $numAccess\n";
    
    // stolen from AlbumDB->getVisibleSomething() 
    $list = array();
    foreach ($albumDB->albumList as $album) {
        //for ($i = 0; $i < $numAlbums; $i++) {       

        //echo "here: " . $gallery->app->albumDir . "\n";
        //$album = $albumDB->getAlbum($gallery->user, $i + 1);

        //echo "album: " . get_class($album) . "\n";

        //if ($album->fields['name'] != 'album311') continue;

        echo "Album name: " . $album->fields['name'] . "\n";
        //continue;

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
            // http://swain.myphotoalbum.com/view_photo.php?set_albumName=album02&id=P6070042_JPG
            //echo "http://$p.myphotoalbum.com/view_photo.php?set_albumName=$albumname&id=$photoid\n";
        }
        */
    }

    $numPhotos = $albumDB->getCachedNumPhotos($gallery->user);
    //echo "number of albums: $numAlbums\n";
    //echo "number of photos: $numPhotos\n";
    echo "$p\t$numAlbums\t$numPhotos\n";
    $totalAlbums += $numAlbums;
    $totalPhotos += $numPhotos;

    //if ($totalAlbums > 100) { break; }
}

echo "total albums: $totalAlbums\n";
echo "total photos: $totalPhotos\n";


    
function explodeLP($album, $p) {

    global $depth;

    if ($depth > 10) {
        return;
    } else {
        $depth++;
    }

    if (get_class($album) != "album") {
        die("explodeLP: Got passed something that is not an album: " . serialize($album));
    }

    global $gallery;

    $oldalbum = $gallery->album;
    $gallery->album = $album;

    //echo "entering explodeLP: ". serialize($album) . "\n";
    echo "in explodeLP: album name: " . $album->fields["name"] . "\n";
    //if ($album->isLoaded()) echo "Yes!\n"; else echo "NIEN\n"; // it is loaded


    $albumname = $album->fields["name"];
    $numItems = $album->numPhotos(1);
    echo "$albumname: number of AlbumItems in this album ($albumname): $numItems\n";
    echo "resize_size: '" 
        . $gallery->album->fields["resize_size"] 
        . "' resize_file_size: '" 
        . $gallery->album->fields["resize_file_size"] 
        . "'";

    //$depth--; return;
    if ($numItems == 0) {
        $gallery->album = $oldalbum;
        $depth--;
        return;
    }
    $displayDir = $album->getAlbumDir();
    $massStorageDir = $album->getMassStorageDir();
    //$massStorageDir = $album->getAlbumDir();
    
    if ( ! is_dir($massStorageDir) ) {
        die("No mass storage dir for $p.");
    }
    //echo "dirs: $displayDir $massStorageDir\n";

    $j = 1; // start counting from one, as is Gallery's lot


    //echo "first loop through the gallery way\n";
    //echo "##################\n";

    $flag = false; // init to false; the loop will set it true if we need to save the album

    while ($j <= $numItems) {
        $albumitem = &$gallery->album->getPhoto($j);
        //echo "$j: " . serialize($albumitem) . "\n";
        if ($albumitem->getIsAlbumName()) {
            
            echo "$albumname: item $j has an albumame ....recursing...\n";
            $myAlbum = new Album();
            $myAlbum->load($gallery->album->isAlbumName($j));

            explodeLP($myAlbum, $p);

            $j = getNextPhoto($j);
            continue;
        } elseif ( ! $albumitem->isResized() ) {
            echo "$albumname: this is not resized: ";

            $tag = $albumitem->image->type;
            $name = escapeshellcmd($albumitem->image->name);

            if ($gallery->album->fields["resize_size"] == "off") {
                echo("This album had resize_size turned off. Resetting.\n");
                $gallery->album->fields["resize_size"] = 640;
            }
            // copied from Album.php, thus the retardation
            if (($gallery->album->fields["resize_size"] > 0 ||
                 $gallery->album->fields["resize_file_size"] > 0 ) 
                && isImage($tag)) {
                $photo = $gallery->album->getPhoto($j);
                list($w, $h) = $photo->image->getRawDimensions();
                if ($w > $gallery->album->fields["resize_size"] ||
                    $h > $gallery->album->fields["resize_size"] ||
                    $gallery->album->fields["resize_file_size"] > 0) {
                    //processingMsg("- " . sprintf(_("Resizing %s"), $name));
                    echo "======> Resizing $name...";
                    $retval = $gallery->album->resizePhoto($j, 
                                                           $gallery->album->fields["resize_size"],
                                                           $gallery->album->fields["resize_file_size"]);
                    echo " resize_photo returned: '$retval'\n";
                }
                else {
                    echo " that was $h by $w ";
                    $sizedname = "$name.sized";
                    echo " (how about $sizedname?) ";
                    
                    if ( ! sw_fs_copy("$massStorageDir/$name.$tag", "$displayDir/$sizedname.$tag") ) 
                        stderr("Could not copy $displayDir/$name.$tag, $displayDir/$sizedname.$tag !");
                    $albumitem->image->resizedName = $sizedname;
                
                }
            }
            $flag = true; // save the album
            $gallery->album->transient->photosloaded = true;
            //echo "\nnow: " . serialize($albumitem->image) . "\n"; 
 
        } else {
            echo "$albumname: This item is resized. ";
        }

        $id = $album->getPhotoId($j);
        echo "$j: $id ";

        if ($albumitem->image)
            ;
        else
            echo " is not an image. ";
        $j = getNextPhoto($j);
        echo "\n";
    }
    if ($flag) {
        echo "$albumname: Saving album " . $album->fields["name"] . "\n";
        $gallery->album->save();
    }
    echo "\n";
    $gallery->album = $oldalbum;
    $depth--;
}
    
// copy of fs_copy from fs_unix.php. Theirs did not return results.
function sw_fs_copy($source, $dest) {
	$umask = umask(0113);
    if (! file_exists($source) ) { echo "Oops! We lost '$source'\n"; return 0; }
	$results = copy($source, $dest);
	umask($umask);
    return $results;
}

// return a list (array) of the directory parts
function dirlist($p) {
    return array( $p[0], "$p[0]$p[1]", "$p[0]$p[1]$p[2]", "$p[0]$p[1]$p[2]$p[3]", "$p[0]$p[1]$p[2]$p[3]$p[4]", $p );
}

/*
 * $Log: makeSized.php,v $
 * Revision 1.7  2005/10/10 13:52:28  swain
 * Fix: if the individual album has resizing turned off, don't honor it, duh. Reset it to 640 and resize the photos.
 *
 * Revision 1.6  2005/09/12 22:28:15  swain
 * This version uses the dual storage.
 *
 * Revision 1.5  2005/08/16 20:33:13  swain
 * Experimental block added: resize the image, don't just copy it, if it
 * meets our requirements.
 *
 * Revision 1.4  2005/08/16 20:23:27  swain
 * Removed hardcoded limit; changed myphotodevel to myphotoalbum, though will replace that with sevice name; changed to use REGEXP instead of LIKE; testing for tmpUser and continuing if failed; using fast storage and not mass storage.
 *
 * Revision 1.3  2005/08/01 22:30:35  swain
 * Solved the reference problem. I was indeed working on a copy of the
 * albumitem. The way I figured it out was to read a file that actually
 * modifies a photo object (edit_caption.php) and trace what happened. As
 * I expected, I just needed an ampersand in the right place.
 *
 * Revision 1.2  2005/08/01 22:03:55  swain
 * Spot checkin: solved the recursion problem. I was passing an AlbumItem
 * to the explodeLP() function, thus the fatal errors.
 *
 * Revision 1.1  2005/07/22 16:46:53  swain
 * First version of a script to create and register .sized. images for
 * all raw images that don't have them.
 *
 *
 */

?>