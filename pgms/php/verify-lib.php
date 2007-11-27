<?

// $Id: verify-lib.php,v 1.37 2006/10/24 21:05:08 swain Exp $

function ensureWWWuser() {

    if ( getenv('USER') != 'www' ) {
        eglog( "You must be user 'www' to run this script, or else you will\n"
               . "change ownership of key files in the gallery sites and break them.\n" );
        exit(1);
    }
    
}

function compareCollections($disp, $mass) {

    $failures = 0;

    foreach ($mass as $albumname => $filearray) {
        if ( ! is_array($filearray) ) die(__FUNCTION__ . ": '$albumname's value is not an array: '$filearray'");
        
        if ( count($filearray) == 0 ) {
            //glog("No full sized images in '$albumname'");
            //$failures++;
            continue;
        }
        // Every *photo* in $massCollection should have a corresponding sized and thumbnail in $dispCollection.
        // Videos do not have a sized image though
        foreach ($filearray as $filename => $filepath) {
            $thumb = insertThumbString($filename);
            $sized = insertSizedString($filename);

            // movies are .flv but have .jpg thumbnails, and no sized
            if ( preg_match('/flv$/', $filename) ) {
                $thumb = preg_replace('/flv$/', 'jpg', $thumb);
                //$sized = preg_replace('/flv$/', 'jpg', $sized);
                
            } elseif ( ! array_key_exists($sized, $disp[$albumname]) ) {
                glog("mass storage check: No correspoding sized for: $albumname $sized");
                $failures++;
            }


            if ( ! array_key_exists($thumb, $disp[$albumname]) ) {
                glog("mass storage check: No corresponding thumb for: $albumname $thumb");
                $failures++;
            }
                 

        }

    }

    foreach ($disp as $albumname => $filearray) {

        if ( count($filearray) == 0 ) {
            //glog("No images in display album '$albumname'");
            //$failures++;
            continue;
        }

        // For every photo (not video):
        // Every thumbnail and sized should have each other, and a full sized file.
        // For every video: there should be a thumbnail.
        // Not every album will have a highlight.
        foreach ($filearray as $displayfile => $filepath) {

            if ( isThumbnail($displayfile) ) {

                $thumbsmate = stripThumbString($displayfile);
                //glog("This is a thumbnail: $displayfile and its mate: $thumbsmate");

                if ( ! array_key_exists($thumbsmate, $mass[$albumname]) ) {
                    // try for a flv file then
                    $maybemovie = preg_replace('/jpg$/', 'flv', $thumbsmate);
                    //glog("trying $maybemovie now.");
                    if ( ! array_key_exists($maybemovie, $mass[$albumname]) ) {
                        glog("gallery data check (thumb): Missing full sized image: $albumname $thumbsmate or $maybemovie");
                        $failures++;
                    }
                }
            } //else { glog("This ain't: $displayfile"); }

            if ( isSizedfile($displayfile) ) {
                $sizedmate = stripSizedString($displayfile);

                if ( ! array_key_exists($sizedmate, $mass[$albumname]) ) {
                    // try for a flv file then
                    $maybemovie = preg_replace('/jpg$/', 'flv', $sizedmate);
                    //glog("trying $maybemovie now.");
                    if ( ! array_key_exists($maybemovie, $mass[$albumname]) ) {
                        glog("gallery data check (sized): Missing full sized image: $albumname $sizedmate or $maybemovie");
                        $failures++;
                    }
                }

                //glog("This is a sized: $displayfile and its mate: $sizedmate");
            }

        }
    }
    return $failures;
}

/**
 * Given a directory, find all the image files in it (movies
 * too). Return an associative array where filename => filepath.
 */
function getImageFiles($dir) {

    if ( ! is_dir($dir) ) die ( __FUNCTION__ . " Passed non dir: '$dir'");

    $collection = array();

    if ( $dh = opendir($dir) ) {
        //glog("Opened '$dir'.");

        while (($file = readdir($dh)) !== false) {
            if ( preg_match('/jpe?g$|gif$|png$|flv$|sized$|thumb$/i', $file) ) {
                //glog("Adding $dir/$file for $albumname...");
                $collection[$file] = "$dir/$file";
            }
        }

        closedir($dh);
    }
    return $collection;
}


/**
 * Given an array of directories, iterate over them and give them an
 * array of all their files.
 */
function findAllImageFiles($dir_array) {

    if ( ! is_array($dir_array) ) die ( __FUNCTION__ . " Passed non array: '$dir'");

    $collection = array();

    foreach ($dir_array as $albumname => $dir) {
        $collection[$albumname] = getImageFiles($dir);
    }

    return $collection;    
}

/**
 * Given an 'albums' directory on either the fast or slow storage,
 * build an array of all the names of the album directories.
 */
function listAlbumDirs($dir) {

    if ( ! is_dir($dir) ) {
        eglog("ERROR: listAlbumDirs() Passed something not a directory: '$dir'");
        return false;
    }

    if ( $dh = opendir($dir) ) {
        //glog("Opened '$dir'.");
        $albums = array();
        while (($albumdir = readdir($dh)) !== false) {
            if ( is_dir("$dir/$albumdir") && ! preg_match('/^\./', $albumdir) ) {
                //glog("adding '$albumdir'..");
                $albums[$albumdir] = "$dir/$albumdir";
            } else {
                //glog("skipping '$albumdir'.");
            }
        }

        closedir($dh);
        return $albums;
    } else {
        eglog("ERROR: Couldn't open dir '$dir' in function listAlbumDirs($dir)");
    }
}


// run is_dir() on our arguments: the two top level albums dirs
// example:
// /mnt/cel-1/vol01/s/sw/swa/swai/swain/swain/albums
// and 
// /mnt/bob-1/vol01/s/sw/swa/swai/swain/swain/albums
function confirmAlbumsDirectoriesExist($celbums, $bobbums) {

    if ( ! is_dir($celbums)) {
        glog("No cel dir '$celbums'");
        return false;
    }

    if ( ! is_dir($bobbums)) {
        glog("No bob dir  '$bobbums'");
        return false;
    }

    return true;
}


function glog ($message) {
    global $p;
    echo "$p: $message\n";
}

function eglog ($message) {
    global $p;
    $stderr = fopen('php://stderr', 'w');
    fwrite($stderr, "$p: $message\n");
    fclose($stderr);
}

function renderCollectionAsText($collection) {
    if ( ! is_array($collection) ) 
        die( __FUNCTION__ . ": was not passed an array: '$collection'");


    foreach ($collection as $album => $photoarray) {
        glog("Album: $album");
        if ( ! is_array($photoarray) ) 
            die( __FUNCTION__ . ": album '$album' has something that's not an array: '$photoarray'" );
        foreach ($photoarray as $photoname => $photopath) {
            glog("--> $photoname $photopath");
        }
    }
}




/**
 * Given an album, visit all of its images; if it contains a subalbum, recurse.
 *
 * The g_*_collection variables passed in are references to complex
 * data structures that this function modifies. This function builds
 * them up from the point of view of Gallery, as opposed to the
 * mass_*_coollection data structures, which show us exactly what is
 * on the filesystem.
 */

function explodeLP($album, $p, &$g_disp_collection, &$g_mass_collection) {

    global $gallery;
    global $depth;
    global $album_nc;


    $albumname = $album->fields["name"];

    // Most of the following assertions were added when I was
    // developing a script to visit every album and reset the
    // thumbnail sizes or something... but they seem like a good
    // safeguard to leave in place. --SW

    $album_nc[$albumname]++;
    if ($album_nc[$albumname] > 1) { 
        //glog("Oops: second time I've looked at '$albumname'!\n");
        return;
    }

    // I used to have recursion problems, so we assume a max depth of
    // 10 and then we bail out.
    // Note: 7/25/06: some crazy people actually create subalbums
    // beyond 10, so upping this to 30. --SW
    if ($depth > 30) {
        die( __FUNCTION__ . ": I'm dying. I recursed more than thirty times. Bye.");
    } else {
        $depth++;
    }

    // If we were not passed an album, the world is in a state of sin.
    if (strtolower(get_class($album)) != "album") {
        die("explodeLP: Got passed something that is not an album: " . serialize($album));
    }


    // Again, legacy stuff. I was trying to get around PHP4's weird
    // reference problems. Also, Gallery might be operating on
    // $gallery->album somewhere down the stack where we don't see it,
    // so it's best not to remove this.
    $oldalbum       = $gallery->album;
    $gallery->album = $album;

    //glog( "entering explodeLP: ". serialize($album));
    //glog( "in explodeLP: album name: " . $album->fields["name"]);
    //if ($album->isLoaded()) glog( "Yes! Album loaded."); else glog( "NIEN, album not loaded.");


    // initialize new arrays for this album's photos
    $g_disp_collection[$albumname] = array();
    $g_mass_collection[$albumname] = array();


    $numItems = $album->numPhotos(1);
    //glog( "$albumname: number of AlbumItems in this album ($albumname): $numItems");
//     echo "resize_size: '" 
//         . $gallery->album->fields["resize_size"] 
//         . "' resize_file_size: '" 
//         . $gallery->album->fields["resize_file_size"] 
//         . "'";


    if ($numItems == 0) {
        // empty album. nothing to do.
        $gallery->album = $oldalbum;
        $depth--;
        return;
    }

    $displayDir     = $album->getAlbumDir();
    $massStorageDir = $album->getMassStorageDir();

    //glog("Using disp storage dir $displayDir");
    //glog("Using mass storage dir $massStorageDir");

    $j = 1; // start counting from one, as is Gallery's way

    //glog( "first loop through the gallery way");
    //$flag = false; // init to false; the loop will set it true if we need to save the album

    while ($j <= $numItems) {
        $albumitem = &$gallery->album->getPhoto($j); // note the use of a ref here. very critical.

        //glog( "$j: " . serialize($albumitem) );
        //glog("type: " . get_class($albumitem));

        if (get_class($albumitem) != 'albumitem') {
            // somehow... thematlockfamily has a stdClass in an album. Weird.
            eglog("In album: " . $gallery->album->fields["name"]);
            eglog("wtf! this is not an albumitem: " . serialize($albumitem));
            $j = getNextPhoto($j);
            continue;
        }

        if ($albumitem->getIsAlbumName()) {
            
            //glog( "$albumname: item $j has an albumame ....recursing..." );
            $myAlbum = new Album();
            $myAlbum->load($gallery->album->isAlbumName($j));

            explodeLP($myAlbum, $p, $g_disp_collection, $g_mass_collection);

            $j = getNextPhoto($j);
            continue;

            /*  

            // elseif: if it was resized, and it's not a movie, then we need to reset
            // the resize_size... this was for an old project.

        } elseif ( ! $albumitem->isResized() && ! $albumitem->isMovie() ) {
            glog( "$albumname: this has some not resized stuff." );

            $tag = $albumitem->image->type;
            $name = escapeshellcmd($albumitem->image->name);

            if ($gallery->album->fields["resize_size"] == "off") {
                glog("This album had resize_size turned off. Resetting.\n");
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
                    glog( "======> Resizing $name..." );
                    $retval = $gallery->album->resizePhoto($j, 
                                                           $gallery->album->fields["resize_size"],
                                                           $gallery->album->fields["resize_file_size"]);
                    glog( " resize_photo returned: '$retval'" );
                }
                else {
                    glog( " that was $h by $w " );
                    $sizedname = "$name.sized";
                    glog( " (how about $sizedname?) " );
                    
                    if ( ! sw_fs_copy("$massStorageDir/$name.$tag", "$displayDir/$sizedname.$tag") ) 
                        stderr("Could not copy $displayDir/$name.$tag, $displayDir/$sizedname.$tag !");
                    $albumitem->image->resizedName = $sizedname;
                
                }
            }
            $flag = true; // save the album
            $gallery->album->transient->photosloaded = true;
            //glog( "\nnow: " . serialize($albumitem->image) ); 

        */ 
        } else {
            //glog( "$albumname: This item is resized. ";
            // verify the file is there
            $tag = $albumitem->image->type;

            // If isMovie() handle it differently.
            // movies screw stuff up because thumbs are jpg, full sized are flv
            // and there is no sized
            if ($tag == 'flv') {
                $ftag = 'flv';
                $tag = 'jpg';
            } else {
                $ftag = $tag;
            }



            $fullsize = $thumbsize = $sizedsize = $highlightsize = "0";

            $name = escapeshellcmd($albumitem->image->name);
            $massdir = $gallery->album->getMassStorageDir();
            $dispdir = $gallery->album->getAlbumDir();

            $g_disp_collection[$albumname]["$name.thumb.$tag"] = remove2Xslash("$displayDir/$name.thumb.$tag");

            if ( ! $thumbsize = @filesize("$displayDir/$name.thumb.$tag") ) {
                glog("xlp: Missing thumb: $name.thumb.$tag.");
                $thumbsize = 0;
            }
            

            if ( ! $albumitem->isMovie() ) {
                $g_disp_collection[$albumname]["$name.sized.$tag"] = remove2Xslash("$displayDir/$name.sized.$tag");
                if ( ! $sizedsize = @filesize("$displayDir/$name.sized.$tag" ) ) {
                    glog("xlp: Missing sized: $displayDir/$name.sized.$tag");
                    $sizedsize = 0;
                }
            }

            $g_mass_collection[$albumname]["$name.$ftag"] = remove2Xslash("$massStorageDir/$name.$ftag");

            if ( ! $fullsize = @filesize("$massStorageDir/$name.$ftag") ) {
                glog("xlp: Missing full sized image: $massStorageDir/$name.$ftag");
                $fullsize = 0;
            }
            
            if ( $albumitem->isHighlight() ) {
                $g_disp_collection[$albumname]["$name.highlight.$tag"] = 
                    remove2Xslash("$displayDir/$name.highlight.$tag");
                
                if ( ! $highlightsize = @filesize("$displayDir/$name.highlight.$tag") ) {
                    glog("xlp: Missing highlight image: $displayDir/$name.highlight.$tag");
                    $highlightsize = 0;
                }
            }

            

            // Now that Veracity has been done for the first time
            // (repeatedly :-), we need to keep Gallery, the
            // filesystem, *AND* the database in sync. So we need to
            // make sure every photo object has an mpa_id and the
            // values match what's in the database.

            // if this $albumitem has an mpa_id, compare this
            // $albumitem with the database row.

            $mpa_id = $albumitem->getExtraField("mpa_id");

            if ( ! empty($mpa_id) ) {

                //glog("Got an mpa_id ('$mpa_id') and will now attempt to validate it...");
                if ( ! validateDBandAlbumitem($mpa_id, $p, $albumname, $name, $ftag) ) {

                    glog("Creating new row for $p, $albumname, $name, $ftag");
                    insertNewAlbumitem($albumitem, $p, $albumname, $name, $ftag,  $fullsize, 
                                       $sizedsize, 
                                       $thumbsize, 
                                       $highlightsize);
                } else {
                    //glog("$mpa_id for $p, $albumname, $name validates.");
                }

            } elseif ( findBySecondaryKey($albumitem, $p, $albumname, $name, $ftag)  ) {
                // else if it does not, test to see if we can find it by
                // the secondary key (username, albumname, filename,
                // extension). If we get a result, save the mpa_id to the
                // object. 
                glog("Found this one in the database by secondary key. Added mpa_id to object.");

            } else {
                // else insert a new row.
                insertNewAlbumitem($albumitem, $p, $albumname, $name, $ftag, $fullsize, 
                                   $sizedsize, 
                                   $thumbsize, 
                                   $highlightsize);
            }
            

            // glog( "Set: $displayDir/$name.thumb.$tag" );
            // glog( "Set: $displayDir/$name.sized.$tag" );
            // glog( "Set: $massStorageDir/$name.$tag" );
            
        }

        $j = getNextPhoto($j);
    }

    $gallery->album->save(); // resurrected from makeSized.php, whence explodeLP() came from
    $gallery->album = $oldalbum;
    $depth--;
}

function validateOrDelete($mpa_id) {

    $dbconn = DBConn::getInstance();

    $result = $dbconn->_queryDB("SELECT * FROM mpa_albumitems WHERE id=$mpa_id");
    $hash = mysql_fetch_assoc($result);

    // test to see if this is a valid mpa_id or not
    $bobdir = $gallery->app->mass_storage_dir;
    $p = $hash['username'];

    $bobbums = "$bobdir/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/albums";

    $file = "${GALLERY_USERDIR}albums/$hash[albumname]/$hash[filename].$hash[extension]";

    if ( ! file_exists($file) ) {
        glog("validateOrDelete: no such file '$file'. Removing from mpa_albumitems.");
        $dbconn->_queryDB("DELETE FROM mpa_albumitems WHERE id=$mpa_id");
    } else {
        glog("validateOrDelete: found file for mpa_id '$mpa_id'. Not touching it.");
    }

}

function validateDBandAlbumitem($mpa_id, $username, $albumname, $filename, $extension) {
    global $gallery;
    $dbconn = DBConn::getInstance();
    //glog("validateDBandAlbumitem Passed $mpa_id");

    $query = "SELECT * FROM mpa_albumitems WHERE id=$mpa_id";
    $result = $dbconn->_queryDB($query);

    if ( (mysql_num_rows($result) == 0) || ($result == false)) {
        glog("validateDBandAlbumitem ERROR: object has mpa_id '$mpa_id' but it was not found in DB!"); 
        return false;
    }

    $hash = mysql_fetch_assoc($result);
    $flag = true;

    if ($username != $hash['username']) {
        eglog("validateDBandAlbumitem ERROR: $username didn't match $hash[username]");
        $flag = false;
    }
    if ($albumname                 != $hash['albumname']) {
        eglog("validateDBandAlbumitem ERROR: $albumname didn't match $hash[albumname]");
        $flag = false;
    }
    if ($filename                  != $hash['filename']) {
        eglog("validateDBandAlbumitem ERROR: $filename didn't match $hash[filename]");
        $flag = false;
    }
    if ($extension                 != $hash['extension']) {
        eglog("validateDBandAlbumitem ERROR: $extension didn't match $hash[extension]");
        $flag = false;
    }

    // If mpa_id is not for this item, test to see if it's a legit
    // mpa_id or not.
    if ($flag == false) {
        validateOrDelete($mpa_id);
    }
    
    return $flag;
}

function findBySecondaryKey(&$albumitem, $username, $albumname, $filename, $extension) {
    global $gallery;
    $dbconn = DBConn::getInstance();

    glog("findBySecondaryKey passed: $albumname, $filename, $extension");
    // query the database and see if this thing is in there via
    // username, albumname, filename, extension

    $query = "SELECT id AS mpa_id
              FROM mpa_albumitems
              WHERE username = '$username' 
              AND albumname  = '$albumname'
              AND filename   = '$filename'
              AND extension  = '$extension'";

    $result = $dbconn->_queryDB($query);

    if ($result == false) return false; // no mpa_id found

    $hash = mysql_fetch_assoc($result);

    if ($hash == false) {
        glog("No match for secondary key $username, $albumname, $filename, $extension");
        return false;
    }

    if ( ! $hash['mpa_id'] > 0 ) {
        eglog("findBySecondaryKey: ERROR: got something else from the database for mpa_id: '$hash[mpa_id]'");
    }

    glog("findBySecondaryKey: Setting mpa_id to $hash[mpa_id]");
    $albumitem->setExtraField('mpa_id', $hash['mpa_id']);
    return true;
}

function insertNewAlbumitem(&$albumitem, 
                            $username, 
                            $albumname, 
                            $filename, 
                            $extension, 
                            $fullsize, 
                            $sizedsize, 
                            $thumbsize, 
                            $highlightsize) {

    global $gallery; // as always
    $dbconn = DBConn::getInstance();
    $conn = $dbconn->getConnection();


    // get upload date, upload tool and from_ip from the mpa_photos table.
    // may as well port the data over now, while we're at it.

    $mpa_photos_query = "SELECT * FROM mpa_photos 
                                 WHERE subdomain = '$p'
                                       AND album = '" . mysql_escape_string($albumname) . "'
                                       AND name  = '" . mysql_escape_string($filename) . "'";

    //echo "Query: $mpa_photos_query\n";
    $res = mysql_query($mpa_photos_query, $conn);
    if ($res == false) {
        echo "query failed! " . mysql_error() . "\n";
        //exit(45); // mpa_photos might be gone now; no exit or die plz.
    }
    if (mysql_num_rows($res)) {
        $hash = mysql_fetch_assoc($res);
        $upload_date = $hash['uploaded'];
        $upload_tool = $hash['uploader'];
        $from_ip     = $hash['from_ip'];
    } else {
        $upload_date = date("Y-m-d H:m:s", $albumitem->getUploadDate());
        $upload_tool = '';
        $from_ip     = '127.0.0.1';
    }


    mysql_free_result($res);



    $insert = "INSERT INTO mpa_albumitems (
                          id, 
                          userid,
                          username,  
                          albumid,  
                          albumname,
                          filename, 
                          fullsize,  
                          thumbsize,  
                          sizedsize,  
                          highlightsize,  
                          extension,
                          upload_date,
                          upload_tool,
                          from_ip
                          )
                       VALUES (
                          NULL,
                          {$gallery->app->mpa_userid},
                          '$username',  
                          0, \n'" . 
        mysql_escape_string($albumname) . "', \n'" .
        mysql_escape_string($filename) . "'\n, 
                          $fullsize, 
                          $thumbsize,  
                          $sizedsize,  
                          $highlightsize,  
                          '$extension',
                          '$upload_date',
                          '$upload_tool',
                          '$from_ip'
                          )
                        ON DUPLICATE KEY UPDATE 
                          fullsize      = fullsize      + $fullsize,
                          thumbsize     = thumbsize     + $thumbsize,
                          sizedsize     = sizedsize     + $sizedsize,
                          highlightsize = highlightsize + $highlightsize,
                          status = 'M'
                          "; // note: we use ON DUPLICATE syntax
                             // because dark energy seems to lead to
                             // duplicate keys. Don't know why yet.
                             // M == "multiple copies"


    if ( mysql_query($insert, $conn) == false ) {
        echo "QUERY FAILED: '$insert'\nERROR MESSAGE: " . mysql_error() . "\n";
        exit(1);
    } else {
        $mpa_id = mysql_insert_id();
        if ( $mpa_id == 0 ) {
            echo "ERROR: didn't get an insert ID!\n";
        } else {
            $albumitem->setExtraField("mpa_id", $mpa_id);
        }
    }
}


// clean our data: remove double slashes that appear like this:
// s93:"/mnt/cel-1/vol01/z/zl/zla/zlat/zlati/zlatinthegreat//albums/MPAOnTheGo/2138_1070004.thumb.gif";
// which are caused by having or not having trailing slashes inconsistently

function remove2Xslash($string) {
    //return $string;
    return preg_replace('/\/\//', '/', $string);
}


/**
 * Given references to two data structures, populate them with the
 * contents of the filesystem for this site. Return the number of
 * errors encountered; zero if there are none. If either of the top
 * level "albums" directories is not there, return 1.
 */

function getFileSystemSnapshot(&$fs_disp_collection, &$fs_mass_collection) {

    global $gallery;
    global $p;
    $failures = 0;

    $celdir = $gallery->app->user_data_root;
    $bobdir = $gallery->app->mass_storage_dir;

    $celbums = "$celdir/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/albums";
    $bobbums = "$bobdir/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/albums";

    if ( ! confirmAlbumsDirectoriesExist($celbums, $bobbums) ) {
        eglog("Giving up on this site, as it has major structural problems (either fast or slow 'albums' dir missing)");
        return 1;
    }

    $fs_disp_albums = listAlbumDirs($celbums);
    $fs_mass_albums = listAlbumDirs($bobbums);

    arsort($fs_disp_albums);
    arsort($fs_mass_albums);

    if ( ($fs_disp_albums == false) && ($fs_mass_albums == false) ) {
        glog("This site has no album dirs.");
        return 0;
    }

    // FIXME: this if() could lead to false positives when the counts
    // are the same, but albums are different.
    if ( count($fs_disp_albums) != count($fs_mass_albums) ) {
        glog("ERROR: The album counts on the filesystem do not match.");
        $failures++;

        foreach ($fs_disp_albums as $albumname => $path) {
            if ( ! array_key_exists($albumname, $fs_mass_albums) ) {
                glog("Missing from bob: $albumname $path");
                $images = getImageFiles($path);
                if (count($images) > 0) glog("VERY BAD: $albumname has images on cel but not bob.");
                else glog("I'd just create a new bob dir for this empty album on cel1.");
            }
        }

        foreach ($fs_mass_albums as $albumname => $path) {
            if ( ! array_key_exists($albumname, $fs_disp_albums) ) {
                glog("Missing from cel: $albumname $path");
                $images = getImageFiles($path);
                if (count($images) > 0) glog("Test to see if Gallery has this album (it's on bob, not cel, probably was deleted)");
            }
        }


    } else {
        glog("User has the correct album layout. " . count($fs_disp_albums) . " albums found.");
    }


    // The "collection" variables have the structure:
    // $thisCollection["albumname"]["filename.ext"] = /full/path/to/file.ext;

    $fs_disp_collection = findAllImageFiles($fs_disp_albums);
    $fs_mass_collection = findAllImageFiles($fs_mass_albums);
    return $failures;
}


// copy of fs_copy from fs_unix.php. Theirs did not return results.
function sw_fs_copy($source, $dest) {
	$umask = umask(0113);
    if (! file_exists($source) ) { 
        eglog( "Oops! We lost '$source'" ); 
        return 0; 
    }
	$results = copy($source, $dest);
	umask($umask);
    return $results;
}


// since regexps are so hard to read, I wrapped them for legibility. --SW

function isThumbnail($filename) {
    return preg_match('/\.thumb\.[^\.]{3,4}/', $filename);
}

function isSizedfile($filename) {
    return preg_match('/\.sized\.[^\.]{3,4}/', $filename);
}

function stripThumbString($filename) {
    return preg_replace('/\.thumb(\.[^\.]{3,4})/', '$1', $filename);
}

function stripSizedString($filename) {
    return preg_replace('/\.sized(\.[^\.]{3,4})/', '$1', $filename);
}

function insertThumbString($filename) {
    return preg_replace('/([^\.]+)$/', 'thumb.$1', $filename);
}

function insertSizedString($filename) {
    return preg_replace('/([^\.]+)$/', 'sized.$1', $filename);
}

?>