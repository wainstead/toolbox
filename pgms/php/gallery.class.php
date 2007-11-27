<?php

// $Id: gallery.class.php,v 1.2 2006/05/23 14:17:19 swain Exp $
/*
if ($argc != 2) die("usage: me <username>\n");
$p = $argv[1];
error_reporting(E_ERROR & ~E_WARNING);


// we MUST be user 'www' 
if ( getenv('USER') != 'www' ) {
    echo( "You must be user 'www' to run this script, or else you will\n"
          . "change ownership of key files in the gallery sites and break them.\n" );
    exit(1);
}

ob_start();

$g = new Gallery($p);
$g->test();

ob_flush();

*/

class Gallery {

    var $albumdb;
    var $username;

    function Gallery($p) {

        global $gallery;
        $this->username = $p;

        ob_start();
        echo "using '$p'\n";

        // FIXME: factor this out. We shoudn't be setting things in $_SERVER.
        $_SERVER['HTTP_HOST'] = sprintf("%s.%s", $p, "service.name");
        require("/opt/mpa/conf/gallery.mysql.conf");

        //$GALLERY_BASEDIR = "/mnt/cel-1/vol01/linkless/gallery/";
        $GALLERY_BASEDIR = "/home/swain/public_html/projects/ampiradev/gallery/";
        $FASTSTORAGE = "/mnt/cel-1/vol01";


        // Gallery expects to find this server variable, which is set in httpd.conf
        $_SERVER['MPA_GALLERY_ROOT'] = $gallery->app->user_data_root;

        chdir($GALLERY_BASEDIR); // fake the DocumentRoot

        $_SERVER['HTTP_HOST'] = sprintf("%s.%s", $p, $gallery->app->service_name);

        $GALLERY_USERDIR = 
            "$FASTSTORAGE/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/";

        require_once($GALLERY_BASEDIR . "init.php");

        require($GALLERY_USERDIR . "config.php");
        echo "photo album url: " . $gallery->app->photoAlbumURL . "\n";
        ob_flush();

        // assert we have loaded this user's data
        if ( ! preg_match( "/$p/", $gallery->app->albumDirURL) ) 
            die("Failed to load the config data for '$p': " 
                . $gallery->app->albumDirURL 
                . "\n");
    

        // authorize us as the admin
        $tmpUser = $gallery->userDB->getUserByUsername('admin');
        if (! isset($tmpUser) ) {
            stderr( "No admin user for this site.");
            exit(3);
        }

        //stderr( "Admin loaded.\n");

        $tmpUser->log("login");
        $tmpUser->save();
        $gallery->session->username = 'admin';
        $gallery->user = $tmpUser;


        $this->albumDB = new AlbumDB();
        $gallery->session->albumName = "";

    }


    function test() {

        global $gallery;

        $numAlbums = count($this->albumDB->albumList);
        $numAccess = $this->albumDB->numAccessibleAlbums($gallery->user);
        if ($numAlbums == 0) {
            stderr("No albums listed by Gallery.");
        }

        foreach ($this->albumDB->albumList as $album) {

            //stderr( "veracity: Album name: " . $album->fields['name'] );

            if ( ! is_object($album) ) {
                stderr( "Could not get the album on index $i!!!");
                exit(22);
            }

            echo("{$album->fields[name]}, {$this->username}\n");
        }
        echo "GALLERY_USERDIR interpolation check: ";
        echo $gallery->app->albumDir . "\n";

    }

}
?>