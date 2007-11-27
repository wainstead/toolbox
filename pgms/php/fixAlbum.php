#!/opt/php4/bin/php
<?php

function stdout($msg) {
    echo "$msg\n";
}

if ($argc != 3) {
    stdout("Usage: fixAlbum.php <username> <albumname>\n");
    exit;
}

// $Id: fixAlbum.php,v 1.2 2005/09/12 22:29:05 swain Exp $


// we MUST be user 'www' 

if ( getenv('USER') != 'www' ) {
    echo "You must be user 'www' to run this script, or else you will "
        . "change ownership of key files in the gallery sites and break them.\n";
    exit(1);
}



require("/opt/mpa/conf/gallery.mysql.conf");

$GALLERY_BASEDIR = "/mnt/cel-1/vol01/linkless/gallery/";
$USER_ROOT = "/mnt/cel-1/vol01";

$_SERVER['MPA_GALLERY_ROOT'] = '/mnt/cel-1/vol01';

chdir($GALLERY_BASEDIR);

    
$p = $argv[1];
$borkedAlbumName = $argv[2];

//stdout("------------> $p\n");
$GALLERY_USERDIR = "$USER_ROOT/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/";

if (! file_exists($GALLERY_USERDIR . "config.php")) {
    stdout("$p does not have a config.php file.\n");
    continue;
}

$mixed = exec("/opt/php4/bin/php -l $GALLERY_USERDIR" . "config.php", $output, $retval);
if ($retval != 0) {
    stdout("$p has a broken config.php file.\n");
    continue;
}

$_SERVER['HTTP_HOST'] = "$p.myphotodevel.com";
require_once($GALLERY_BASEDIR . "init.php");
require($GALLERY_USERDIR . "config.php");

// this has to be printed after session.php is loaded
stdout("user: $p album: $borkedAlbumName\n");

// authorize us as the admin
$tmpUser = $gallery->userDB->getUserByUsername('admin');
$tmpUser->log("login");
$tmpUser->save();
$gallery->session->username = 'admin';
$gallery->user = $tmpUser;

//stdout(serialize($gallery->user));

$albumDB = new AlbumDB(FALSE);
$gallery->session->albumName = "";
$page = 1;

$gallery->album = $albumDB->getAlbumByName($borkedAlbumName);
//stdout(serialize($borkedalbum);
$url = $gallery->album->getAlbumDir();
stdout("\n");

$url = preg_replace('/\/\//', '/', $url);

// this stuff taken from save_photos.php
// suck in all the images, make them into one big $userfile
if (fs_is_dir($url)) {
    stdout("Processing '$url' as a local directory.\n");
    $handle = fs_opendir($url);
    while (($file = readdir($handle)) != false) {
        if ($file != "." && $file != "..") {
            $tag = ereg_replace(".*\.([^\.]*)$", "\\1", $file);
            $tag = strtolower($tag);
            if (acceptableFormat($tag)) {
                if (preg_match('/thumb|sized|highlight/', $file)) // skip the flotsam
                    continue;
                /* Tack it onto userfile */
                if (substr($url,-1) == "/") {
                    $image_tags[] = fs_export_filename($url . $file);
                } else {
                    $image_tags[] = fs_export_filename($url . "/" . $file);
                }
            }
        }
    }
    closedir($handle);


    $tag = ereg_replace(".*\.([^\.]*)$", "\\1", $url);
    $tag = strtolower($tag);

//     /* If the URI doesn't start with a scheme, prepend 'http://' */
//     if (!fs_is_file($url)) {
//         if (!ereg("^(http|ftp)", $url)) {
//             $url = "http://$url";
//         }

//         /* Parse URL for name and file type */
//         $url_stuff = parse_url($url);
//         if (!isset($url_stuff["path"])) { 
//             $url_stuff["path"]="";
//         }
//         $name = basename($url_stuff["path"]);

//    } else {
    $name = basename($url);
        //			$name = eregi_replace(".$tag\$", "", $name);

        //    }
    /* Dont output warning messages if we cant open url */
	
    /*
     * Try to open the url in lots of creative ways.
     * Do NOT use fs_fopen here because that will pre-process
     * the URL in win32 style (ie, convert / to \, etc).
     */
    $id = @fopen($url, "rb");
    if (!ereg("http", $url)) {
        if (!$id) $id = @fopen("http://$url", "rb");
        if (!$id) $id = @fopen("http://$url/", "rb");
    }
    if (!$id) $id = @fopen("$url/", "rb");

    if ($id) {
        stdout(urldecode($url));
    } else {
        stdout(sprintf(_("Could not open url: %s"), 
                              $url));
        continue;
    } 
	
    /* copy file locally */
    $file = $gallery->app->tmpDir . "/photo.$name";
    $od = fs_fopen($file, "wb");
    if ($id && $od) {
        while (!feof($id)) {
            fwrite($od, fread($id, 65536));
            set_time_limit($gallery->app->timeLimit);
        }
        fclose($id);
        fclose($od);
    }

    /* Make sure we delete this file when we're through... */
    $temp_files[$file]=1;
	
    /* If this is an image or movie - add it to the processor array */
    if (acceptableFormat($tag) || !strcmp($tag, "zip")) {
        /* Tack it onto userfile */
        $userfile_name[] = $name;
        $userfile[] = $file;
    } else {
        /* Slurp the file */
        stdout(sprintf(_("Parsing %s for images..."),
                              $url));
        $fd = fs_fopen ($file, "r");
        echo "$file size: " . fs_filesize($file) . "\n";
        $contents = fread ($fd, fs_filesize ($file));
        fclose ($fd);
	
        /* We'll need to add some stuff to relative links */
        $base_url = $url_stuff["scheme"] . '://' . $url_stuff["host"];
        $base_dir = '';
        if (isset($url_stuff["port"])) {
            $base_url .= ':' . $url_stuff["port"];
        }
	
        /* Hack to account for broken dirname */
        if (ereg("/$", $url_stuff["path"])) {
            $base_dir = $url_stuff["path"];
        } else {
            $base_dir = dirname($url_stuff["path"]);
        }
	
        /* Make sure base_dir ends in a / ( accounts for empty base_dir ) */
        if (!ereg("/$", $base_dir)) {
            $base_dir .= '/';
        }

        $things = array();
        while ($cnt = eregi('(src|href)="?([^" >]+\.' . acceptableFormatRegexp() . ')[" >]',
                            $contents, 
                            $results)) {
            set_time_limit($gallery->app->timeLimit);
            $things[$results[2]]=1;
            $contents = str_replace($results[0], "", $contents);
        }

        /* Add each unique link to an array we scan later */
        foreach (array_keys($things) as $thing) {

            /* 
             * Some sites (slashdot) have images that start with // and this
             * confuses Gallery.  Prepend 'http:'
             */
            if (!strcmp(substr($thing, 0, 2), "//")) {
                $thing = "http:$thing";
            }

            /* Absolute Link ( http://www.foo.com/bar ) */
            if (substr($thing, 0, 4) == 'http') {
                $image_tags[] = $thing;

				/* Relative link to the host ( /foo.bar )*/
            } elseif (substr($thing, 0, 1) == '/') {
                $image_tags[] = $base_url . $thing;

				/* Relative link to the dir ( foo.bar ) */
            } else {
                $image_tags[] = $base_url . $base_dir . $thing;
            }
        }
	
        /* Tell user how many links we found, but delay processing */
        stdout(sprintf(_("Found %d images"), count($image_tags)));
    }
} else {
    stdout("$url is not a local directory!\n");
    exit;
}

for ($x = 0; $x < count($image_tags); $x++) {
    stdout($image_tags[$x] . "\n");
}

exit;

// process the images, then delete the temporaries
$image_count=0;
while (isset($userfile) && sizeof($userfile)) {
	$name = array_shift($userfile_name);
	$file = array_shift($userfile);
	if (!empty($usercaption) && is_array($usercaption)) {
	    $caption = removeTags(array_shift($usercaption));
	}
	if (!isset($caption)) {
        $caption="";
    }
	if (get_magic_quotes_gpc()) {
		$caption=stripslashes($caption);    
	}

	$tag = ereg_replace(".*\.([^\.]*)$", "\\1", $name);
	$tag = strtolower($tag);

	if ($name) {
		if (!isset($setCaption)) {
			$setCaption = '';
		}
		processNewImage($file, $tag, $name, $caption, $setCaption);
		$image_count++;
	}
}

$gallery->album->save(array(i18n("%d files uploaded"), $image_count));

if ($temp_files) {
	/* Clean up the temporary url file */
	foreach ($temp_files as $tf => $junk) {
		fs_unlink($tf);
	}
}


?>