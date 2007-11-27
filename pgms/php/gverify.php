<?php

// $Id: gverify.php,v 1.4 2006/01/24 21:06:50 swain Exp $


// usage: this script and a valid username.

if ($argc != 2) die("usage: me <initial string>\n");
$p = $argv[1];

// we now have a catch 22: service name is defined in the conf file,
// so I kludge it thusly.
$_SERVER['HTTP_HOST'] = sprintf("%s.%s", $p, "service.name");


require("./verify-lib.php");
require("/opt/mpa/conf/gallery.mysql.conf");
// we MUST be user 'www' 
ensureWWWuser();

//$GALLERY_BASEDIR = "/mnt/cel-1/vol01/linkless/gallery/";
$GALLERY_BASEDIR = "/home/swain/public_html/projects/ampiradev/gallery/";
$FASTSTORAGE = "/mnt/cel-1/vol01";


// Gallery expects to find this server variable, which is set in httpd.conf
$_SERVER['MPA_GALLERY_ROOT'] = $gallery->app->user_data_root;

chdir($GALLERY_BASEDIR); // fake the DocumentRoot

// We still use mysql sessions even from the command line. A script
// will just silently fail if it cannot access the sessions db, it
// seems.

$conn = mysql_pconnect($gallery->app->mpa_mysql_host,
                       $gallery->app->mpa_mysql_username,
                       $gallery->app->mpa_mysql_password);

if (! $conn) {
    eglog("MPA: Failed to connect to mysql.");
}

if (! mysql_select_db($gallery->app->mpa_mysql_db, $conn) ) {
    eglog("MPA: Failed to select mpa database.\n");
}


$dispCollection = array();
$massCollection = array();


$depth = 0; // protect against infinite recursion
$GALLERY_USERDIR = "$FASTSTORAGE/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/";

if (! file_exists($GALLERY_USERDIR . "config.php")) {
    eglog( "$p does not have a config.php file.\n($GALLERY_USERDIR/config.php)\n");
    exit(1);
}

$mixed = exec("/opt/php4/bin/php -l $GALLERY_USERDIR" . "config.php", $output, $retval);
if ($retval != 0) {
    eglog( "$p has a broken config.php file.\n");
    exi(2);
}



$_SERVER['HTTP_HOST'] = sprintf("%s.%s", $p, $gallery->app->service_name);

require_once($GALLERY_BASEDIR . "init.php");
require($GALLERY_USERDIR . "config.php");


// authorize us as the admin
$tmpUser = $gallery->userDB->getUserByUsername('admin');
if (! isset($tmpUser) ) {
    eglog( "No admin user for this site. Exiting.");
    exit(3);
}

glog( "Admin loaded.\n");

$tmpUser->log("login");
$tmpUser->save();
$gallery->session->username = 'admin';
$gallery->user = $tmpUser;


$albumDB = new AlbumDB();
$gallery->session->albumName = "";
$page = 1;

$numAlbums = count($albumDB->albumList);
$numAccess = $albumDB->numAccessibleAlbums($gallery->user);
//glog( "Number of albums in this site: $numAlbums");
//glog( "Number of accessible (?) albums: $numAccess");
    
// stolen from AlbumDB->getVisibleSomething() 
$list = array();
foreach ($albumDB->albumList as $album) {

    //glog( "Album name: " . $album->fields['name'] );

    if ( ! is_object($album) ) {
        eglog( "Could not get the album on index $i!!!");
        continue;
    }

    explodeLP($album, $p);
}

glog( "done done done.");
glog("Sizes: " . count($dispCollection) . " " . count($massCollection) . "\n");
compareCollections($dispCollection, $massCollection);

renderCollectionAsText($dispCollection);






// given an album, visit all of its images; if it contains a subalbum, recurse.
// This populates the globals $dispCollection and $massCollection.
    
function explodeLP($album, $p) {

    global $gallery;
    global $depth;
    global $dispCollection;
    global $massCollection;


    if ($depth > 10) {
        die( __FUNCTION__ . ": I'm dying. I recursed more than ten times. Bye.");
    } else {
        $depth++;
    }

    if (get_class($album) != "album") {
        die("explodeLP: Got passed something that is not an album: " . serialize($album));
    }



    $oldalbum = $gallery->album;
    $gallery->album = $album;

    //glog( "entering explodeLP: ". serialize($album));
    glog( "in explodeLP: album name: " . $album->fields["name"]);
    //if ($album->isLoaded()) glog( "Yes! Album loaded."); else glog( "NIEN, album not loaded.");


    $albumname = $album->fields["name"];

    $dispCollection[$albumname] = array();
    $massCollection[$albumname] = array();


    $numItems = $album->numPhotos(1);
    glog( "$albumname: number of AlbumItems in this album ($albumname): $numItems");
//     echo "resize_size: '" 
//         . $gallery->album->fields["resize_size"] 
//         . "' resize_file_size: '" 
//         . $gallery->album->fields["resize_file_size"] 
//         . "'";

    //$depth--; return;
    if ($numItems == 0) {
        $gallery->album = $oldalbum;
        $depth--;
        return;
    }
    $displayDir = $album->getAlbumDir();
    $massStorageDir = $album->getMassStorageDir();

    // verify.php does the same thing. Share a method why don't we?    
    if ( ! is_dir($massStorageDir) ) {
        die("No mass storage dir for $p.");
    }

    if ( ! is_dir($displayDir) ) {
        die("No display directory for $p.");
    }

    //glog( "dirs: $displayDir $massStorageDir");

    $j = 1; // start counting from one, as is Gallery's lot


    //glog( "first loop through the gallery way");
    //$flag = false; // init to false; the loop will set it true if we need to save the album

    while ($j <= $numItems) {
        $albumitem = &$gallery->album->getPhoto($j);
        //glog( "$j: " . serialize($albumitem) );
        if ($albumitem->getIsAlbumName()) {
            
            glog( "$albumname: item $j has an albumame ....recursing..." );
            $myAlbum = new Album();
            $myAlbum->load($gallery->album->isAlbumName($j));

            explodeLP($myAlbum, $p);

            $j = getNextPhoto($j);
            continue;
        } elseif ( ! $albumitem->isResized() ) {
            glog( "$albumname: this is not resized: " );

//             $tag = $albumitem->image->type;
//             $name = escapeshellcmd($albumitem->image->name);

//             if ($gallery->album->fields["resize_size"] == "off") {
//                 glog("This album had resize_size turned off. Resetting.\n");
//                 $gallery->album->fields["resize_size"] = 640;
//             }
//             // copied from Album.php, thus the retardation
//             if (($gallery->album->fields["resize_size"] > 0 ||
//                  $gallery->album->fields["resize_file_size"] > 0 ) 
//                 && isImage($tag)) {
//                 $photo = $gallery->album->getPhoto($j);
//                 list($w, $h) = $photo->image->getRawDimensions();
//                 if ($w > $gallery->album->fields["resize_size"] ||
//                     $h > $gallery->album->fields["resize_size"] ||
//                     $gallery->album->fields["resize_file_size"] > 0) {
//                     //processingMsg("- " . sprintf(_("Resizing %s"), $name));
//                     glog( "======> Resizing $name..." );
//                     $retval = $gallery->album->resizePhoto($j, 
//                                                            $gallery->album->fields["resize_size"],
//                                                            $gallery->album->fields["resize_file_size"]);
//                     glog( " resize_photo returned: '$retval'" );
//                 }
//                 else {
//                     glog( " that was $h by $w " );
//                     $sizedname = "$name.sized";
//                     glog( " (how about $sizedname?) " );
                    
//                     if ( ! sw_fs_copy("$massStorageDir/$name.$tag", "$displayDir/$sizedname.$tag") ) 
//                         stderr("Could not copy $displayDir/$name.$tag, $displayDir/$sizedname.$tag !");
//                     $albumitem->image->resizedName = $sizedname;
                
//                 }
//             }
//             $flag = true; // save the album
//             $gallery->album->transient->photosloaded = true;
//             //glog( "\nnow: " . serialize($albumitem->image) ); 

        } else {
            //glog( "$albumname: This item is resized. ";
            // verify the file is there
            $tag = $albumitem->image->type;
            $name = escapeshellcmd($albumitem->image->name);
            $massdir = $gallery->album->getMassStorageDir();
            $dispdir = $gallery->album->getAlbumDir();

            if ( is_file("$displayDir/$name.thumb.$tag") ) {
                $dispCollection[$albumname]["$name.thumb.$tag"] = "$displayDir/$name.thumb.$tag";
            } else {
                eglog("Missing thumb: $name.thumb.$tag.");
            }
            
            if ( is_file("$displayDir/$name.sized.$tag" ) ) {
                $dispCollection[$albumname]["$name.sized.$tag"] = "$displayDir/$name.sized.$tag";
            } else {
                eglog("Missing sized: $displayDir/$name.sized.$tag");
            }

            if ( is_file("$massStorageDir/$name.$tag") ) {
                $massCollection[$albumname]["$name.$tag"] = "$massStorageDir/$name.$tag";
            } else {
                eglog("Missing full sized image: $massStorageDir/$name.$tag");
            }

//             glog( "Set: $displayDir/$name.thumb.$tag" );
//             glog( "Set: $displayDir/$name.sized.$tag" );
//             glog( "Set: $massStorageDir/$name.$tag" );
            
        }

        $id = $album->getPhotoId($j);
        glog( "$j: $id " );

        if ($albumitem->image)
            ;
        else
            eglog( " is not an image. " );
        $j = getNextPhoto($j);
        glog( "\n" );
    }

    $gallery->album = $oldalbum;
    $depth--;
}
    
// copy of fs_copy from fs_unix.php. Theirs did not return results.
function sw_fs_copy($source, $dest) {
	$umask = umask(0113);
    if (! file_exists($source) ) { eglog( "Oops! We lost '$source'" ); return 0; }
	$results = copy($source, $dest);
	umask($umask);
    return $results;
}


/*
 * $Log: gverify.php,v $
 * Revision 1.4  2006/01/24 21:06:50  swain
 * Moved the code that checks the user to verify-lib.php.
 *
 * Revision 1.3  2005/10/18 16:28:40  swain
 * Converted all echo calls to glog and eglog.
 *
 * Revision 1.2  2005/10/17 02:15:30  swain
 * Managed to integrate the compareCollections() function; I was inadvertently adding all files to the collections whether they were on the filesystem or not. It's a start. I suppose the next thing to do is merge the scripts.
 *
 * Revision 1.1  2005/10/17 01:51:54  swain
 * First hacked up version of makeSized.php that builds the same data structures as verify.php.
 *
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