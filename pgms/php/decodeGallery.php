#!/opt/php4/bin/php
<?php

// usage: this script and a valid username.
if ($argc != 2) die("usage: me subdomain\n");

$subdomain = $argv[1];
$_SERVER['MPA_GALLERY_ROOT'] = '/mnt/cel-1/vol01';
$_SERVER['HTTP_HOST'] = "$subdomain.myphotodevel.com";

$GALLERY_BASEDIR = "/home/swain/public_html/projects/ampiradev/gallery/";

chdir($GALLERY_BASEDIR);


require $GALLERY_BASEDIR . "init.php";

$albumDB = new AlbumDB(FALSE);
$gallery->session->albumName = "";
$page = 1;


/* If there are albums in our list, display them in the table */
$numAlbums = $albumDB->numAlbums($gallery->user);
$numPhotos = $albumDB->getCachedNumPhotos($gallery->user);
$numAccess = $albumDB->numAccessibleAlbums($gallery->user);

echo "number of albums: $numAlbums\n";
echo "number of photos: $numPhotos\n";
echo "number of accesses: $numAccess\n";


$uname = 'admin';    
$tmpUser = $gallery->userDB->getUserByUsername($uname);
$tmpUser->log("login");
$tmpUser->save();
$gallery->session->username = $uname;
if ($tmpUser->getDefaultLanguage() != "") {
    $gallery->session->language = $tmpUser->getDefaultLanguage();
}




// rock on. this works.
echo "userDB class type: " . get_class($gallery->userDB) . "\n";
$tmpUser = $gallery->userDB->getUserByUsername('admin');
echo "tmpUser class: " . get_class($tmpUser) . "\n";
echo "tmpUser full name: " . $tmpUser->fullname;
echo "\n";

echo "user key/value pairs:\n";
foreach ($tmpUser as $key => $val) {
    echo "$key: $val\n";
}

echo "userDB key/value pairs:\n";
foreach ($gallery->userDB as $key => $val) {
    echo "$key: $val\n";
}

echo "\$gallery key/value pairs:\n";
foreach ($gallery as $key => $val) {
    echo "$key: $val\n";
}

?>