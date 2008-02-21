#!/opt/php5/bin/php
<?php

error_reporting(E_ALL);

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

$g = galleryFactory('swain');

print "testing gallery...\n";
$g->test();

ob_flush();



class Gallery {

    var $albumdb;
    var $username;

    function __construct($p) {

        $this->username = $p;

        ob_start();
        echo "using '$p'\n";
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

/**
 * The problem is: we instantiate $gallery in a function. That
 * variable is not visible to incluced or required files. If it were
 * in the global scope it would work. The alternative is to do
 * something like:

$GLOBALS['swain'] = new Gallery('swain');

and everywhere we replace via regexp:

$gallery->app->something
to
$GLOBALs['swain']->app->something

Now, the problem becomes gallery.conf and config.php. Here's the remedy:

1. everything in gallery.conf becomes a defined constant. Scoping solved.
2. make crossover copies of config.php, mass regexping $gallery to $GLOBALS['sitename']

Even then, there's no guarantee. But it will be fun to try.
 */
function galleryFactory($p) {
    print "instantiating gallery...\n";
    $gallery = new Gallery($p);
    print "class check: " . get_class($gallery) . "\n";
    // FIXME: factor this out. We shoudn't be setting things in $_SERVER.
    $_SERVER['HTTP_HOST'] = sprintf("%s.%s", $p, "service.name");
    require("/opt/mpa/conf/gallery.conf");
    print "class check after loading conf: " . get_class($gallery) . "\n";
    print "mysql host: {$gallery->app->mpa_mysql_host}}\n";

    //$GALLERY_BASEDIR = "/mnt/fast/vol01/linkless/gallery/";
    $GALLERY_BASEDIR = "/home/swain/public_html/projects/ampiradev/gallery/";
    $FASTSTORAGE = "/mnt/fast/vol01";


    // Gallery expects to find this server variable, which is set in httpd.conf
    $_SERVER['MPA_GALLERY_ROOT'] = $gallery->app->user_data_root;

    chdir($GALLERY_BASEDIR); // fake the DocumentRoot

    $_SERVER['HTTP_HOST'] = sprintf("%s.%s", $p, $gallery->app->service_name);

    $GALLERY_USERDIR = 
        "$FASTSTORAGE/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/";
    print "class check before init: " . get_class($gallery) . "\n";
    require_once($GALLERY_BASEDIR . "init.php");
    print "class check after init: " . get_class($gallery) . "\n";
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


    $gallery->albumDB = new AlbumDB();
    $gallery->session->albumName = "";
    print "returning gallery object: " . get_class($gallery) . "\n";
    return $gallery;
}

?>