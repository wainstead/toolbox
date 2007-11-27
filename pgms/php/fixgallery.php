#!/opt/php4/bin/php
<?php


if ($argc != 5 || in_array($argv[1], array('--help', '-help', '-h', '-?'))) {
?>
This is a command line PHP script with one option.

  Usage:
  <?php echo $argv[0]; ?> directory

  where the directory is the site you want to fix.

<?
    exit(1);                              
}


if ( ! file_exists($argv[4]) ) {
    echo "No such directory: $argv[4]\n";
    die();
}

if ( ! chdir($argv[4]) ) {
    echo "Cannot chdir to $argv[1]\n";
    die();
}



if (!isset($GALLERY_BASEDIR)) {
    $GALLERY_BASEDIR = './';
}
require($GALLERY_BASEDIR . "init.php"); 
include($GALLERY_BASEDIR . 'ldap.php');
require($GALLERY_BASEDIR . 'user.local.php');
require($GALLERY_BASEDIR . "classes/remote/GalleryRemoteProperties.php");

$uname = $argv[1];
$gallerypassword = $argv[2];
$albumname = $argv[3];

$tmpUser = $gallery->userDB->getUserByUsername($uname);
if ($tmpUser && $tmpUser->isCorrectPassword($gallerypassword)) {
    
    $tmpUser = $gallery->userDB->getUserByUsername($uname);
    
    $tmpUser->log("login");
    $tmpUser->save();
    $gallery->session->username = $uname;
    $gallery->user = $tmpUser;
} else {
    echo "Error authenticating (could not get user object)";
    die();
}


$albumDB = new AlbumDB(false);
$gallery->album = $albumDB->getAlbumByName($albumname, TRUE);

if ($gallery->album == 0) {
    echo "no such album: $albumname\n";
    die();
}


if ($dp = opendir("albums/$albumname")) {
   while (false !== ($file = readdir($dp))) {
       if ($file == "..") continue;
       if ($file == ".") continue;
       $albumdirs[] = $file;
       echo "$file\n";

       $foo = new Image();
       $foo->setFile("albums/$albumname/$file");
       echo $foo->getRawdimensions(), "\n";

       //array_push($albumdirs, $file);

   }

   closedir($dp);
}

if ($file = file("albums/$albumname/photos.dat")) {
    $photos = unserialize($file[0]);
    echo "Count of photos array: " . count($photos) . "\n";
}


?>
<?
// stuff taken from albums.php

//$GALLERY_BASEDIR = './';
// require($GALLERY_BASEDIR . 'init.php');
// //require($GALLERY_BASEDIR . 'gallery_remote2.php'); // me added, not from albums.php
// $gallery->session->offlineAlbums["albums.php"]=true;

// /* Read the album list */
// $albumDB = new AlbumDB(FALSE);
// $gallery->session->albumName = "";
// $page = 1;


// /* If there are albums in our list, display them in the table */
// $numAlbums = $albumDB->numAlbums($gallery->user);
// $numPhotos = $albumDB->getCachedNumPhotos($gallery->user);
// $numAccess = $albumDB->numAccessibleAlbums($gallery->user);

// echo("thar be albums here: $numAlbums\n");
// //echo("thar be here: $numAlbums $numPhotos $numAccess\n");





// $albumdirs = array();

// if ($dp = opendir("albums")) {
//    while (false !== ($file = readdir($dp))) {
//        if ($file == "..") continue;
//        if ($file == ".") continue;
//        if ($file == ".users") continue;
//        if (is_dir("albums/$file")) {
//            $albumdirs[] = $file;
//            echo "$file\n";
//        }
//        //array_push($albumdirs, $file);

//    }

//    closedir($dp);
// }

// echo("Number of album folders: " . count($albumdirs) . "\n");
// for ($i = 0; $i < count($albumdirs); $i++) 
//      echo "$albumdirs[$i]\n";

?>