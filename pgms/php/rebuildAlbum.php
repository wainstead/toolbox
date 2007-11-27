#!/opt/php4/bin/php
<?php

// $Id: rebuildAlbum.php,v 1.2 2005/07/19 20:22:39 swain Exp $

// rebuild a user's album. The images are usually already in the album. Set subdomain and album name.

$p = "mastrophotos";
$albumToLoad = "Welcome";


$GALLERY_BASEDIR = "/mnt/cel-1/vol01/linkless/gallery/";
//$GALLERY_BASEDIR = "/home/swain/public_html/projects/ampiradev/gallery/";
$USER_ROOT = "/mnt/cel-1/vol01";

$_SERVER['MPA_GALLERY_ROOT'] = '/mnt/cel-1/vol01';

chdir($GALLERY_BASEDIR);



$GALLERY_USERDIR = "$USER_ROOT/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/";

$_SERVER['HTTP_HOST'] = "$p.myphotodevel.com";
require_once($GALLERY_BASEDIR . "init.php");
require($GALLERY_USERDIR . "config.php");

// authorize us as the admin
$tmpUser = $gallery->userDB->getUserByUsername('admin');
$tmpUser->log("login");
$tmpUser->save();
$gallery->session->username = 'admin';
$gallery->user = $tmpUser;

$albumDB = new AlbumDB(FALSE);
$gallery->session->albumName = "";
$page = 1;

$numAlbums = $albumDB->numAlbums($gallery->user);

$gallery->album = new Album;
$gallery->album->load($albumToLoad);

$albumdir =  $gallery->album->getAlbumDir();
$albumdir = preg_replace('/\/\//', '/', $albumdir);
echo "using '$albumdir'...\n";

$files = getFiles($albumdir);

for ($x = 0; $x < count($files); $x++ ) {
    echo "working on: $files[$x]...\n";
    $filename = basename($files[$x]);
    list($basename, $tag) = explode(".", $filename);
    echo "$basename and $tag\n";
    //processNewImage($file, $tag, $name, $caption, $setCaption);

    $ret = $gallery->album->addPhoto(
                            $files[$x],
                            $tag,
                            $basename,
                            "",
                            "",
                            array(),
                            $tmpUser->getUid()
                            );

    if ($ret != 0) {
        echo "Error! Failed to add $files[$x].\n";
    }
}

$gallery->album->save();

//echo $tmpUser->getUid();
//echo "\n";

function getFiles($directory) {
   // Try to open the directory
   if($dir = opendir($directory)) {
       // Create an array for all files found
       $tmp = Array();

       // Add the files
       while($file = readdir($dir)) {

           list($filename, $tag) = explode(".", $file);

           // Make sure the file exists
           if(
              ($file != "." && $file != ".." && $file[0] != '.')
              &&
              (! preg_match('/sized|thumb|highlight/', $file) ) && isImage($tag)
              ) {
               array_push($tmp, $directory . "/" . $file);
               
           }
       }

       // Finish off the function
       closedir($dir);
       return $tmp;
   }
}


?>