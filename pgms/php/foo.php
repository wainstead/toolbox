<?

/*
 * Given a user site 'p', list all albums; but given user site 'p' and
 * album name 'a' display all thumbnails for that site. Steve
 * Wainstead, Feb 2005
 */


ini_set("display_errors",true);
error_reporting(E_ALL);

$root = '/mnt/cel-1/mpa1/web';
$imgserver = 'http://images.myphotoalbum.com';

function makealbumdir($p) {
    global $root;
    // reflects the new directory structure of 5 characters
    $albumdir = "$root/$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p/albums/";
    return $albumdir;
}

function makefilenames($albumdir, $file, $albumname = "") {

    global $root;
    global $HTTP_GET_VARS;
    if (isset($HTTP_GET_VARS['a'])) {
        $albumname = $HTTP_GET_VARS['a'];
    }

    $sizedfile = preg_replace('/\.thumb/', '.sized', $file);
    $fullfile  = preg_replace('/\.thumb/', ''      , $file);
    $displayfile = "";
    //echo "looking for $albumdir$albumname/$sizedfile<br>";

    if (is_file("$albumdir$albumname/$sizedfile"))
        $displayfile = $sizedfile;
    else
        $displayfile = $fullfile;

    return array($sizedfile, $fullfile, $displayfile);
}

function listalbums($p) {

    global $root;
    $albums = array();


    $albumdir = makealbumdir($p);
    
    $string = "<h3>$albumdir</h3>";

    // Open a known directory, and proceed to read its contents
    if (is_dir($albumdir)) {
        if ($dh = opendir($albumdir)) {
            $albumcount = 0;
            while (($file = readdir($dh)) !== false) {
                if ( (filetype($albumdir . $file) == 'dir')
                     && ( $file != '.' && $file != '..' && $file != '.users')
                     ) {
                    //echo "filename: $file : filetype: " . filetype($albumdir . $file) . "<br>\n";

                    //          http://swain.myphotoalbum.com/view_album.php?set_albumName=album05
                    $albumcount++;
                    array_push($albums, $file);
                    $string .=  "<a href='/foo.php?p=$p&a=$file'>$file<a><br>";
                }
            }
            closedir($dh);
            if ($albumcount == 0) {
                echo "No albums in this site.";
            }
        }
        return $albums;
        //return $string;
    } else {
        echo "'$albumdir' is not a valid directory.<p>\n";
    }

}

function makealbumpath($p) {
    //echo "<h1>got: $p</h1>";
    return "$p[0]/$p[0]$p[1]/$p[0]$p[1]$p[2]/$p[0]$p[1]$p[2]$p[3]/$p[0]$p[1]$p[2]$p[3]$p[4]/$p";
}

function listthumbs($p, $a) {

    global $root;
    $thumbs = array();

    $albumpath = makealbumpath($p);
    //$encodedpath = urlencode($albumpath);

    //echo "$p and $a<p>";
    $albumdir = "$root/$albumpath/albums/$a";

    // Open a known directory, and proceed to read its contents
    if (is_dir($albumdir)) {

        if ($dh = opendir($albumdir)) {
            $counter = 0;
            while (($file = readdir($dh)) !== false) {
                //if ( preg_match('/jpe?g$/i', $file) ) {
                if ( preg_match('/thumb/i', $file) ) {
                    array_push($thumbs, $file);
                    $counter++;
                }
            }
            closedir($dh);
        }
        if ($counter == 0) {
            echo "No jpeg files in this album.";
        } else {
            return $thumbs;
        }
    } else {
        echo "'$albumdir' is not a valid directory.<p>\n";
    }

}

//echo "Hello, sailor!<p>";
if ( isset($HTTP_GET_VARS['z']) ) {

    // render all thumbnail images in all albums

    $p = $HTTP_GET_VARS['z'];
    //echo "<h1>p: $p</h1>";

    $albumpath = makealbumpath($p);
    $encodedpath = urlencode($albumpath);
    $albumdir = makealbumdir($p);
    $albums = listalbums($p);

    //echo "<h3>albumpath $albumpath albumdir $albumdir</h3>";
    //echo "<h2>album count: " . count($albums) . "</h2>";

    reset($albums);

    for ($x = 0; $x < count($albums); $x++) {

        echo "<h4>album: <a href='http://$_SERVER[HTTP_HOST]/foo.php?p=$p&a=$albums[$x]'>$albums[$x]</a></h4>";

        $thumbs = listthumbs($p, $albums[$x]);
        if ( ! count($thumbs) ) continue;
        reset($thumbs);

        for ($y = 0; $y < count($thumbs); $y++) {
            list($sizedfile, $fullfile, $displayfile) = makefilenames($albumdir, $thumbs[$y], $albums[$x]);
            //echo "<img src='http://images.myphotoalbum.com/$albumpath/albums/$albums[$x]/$thumbs[$y]'>";
            echo "<a href='http://$_SERVER[HTTP_HOST]/foo.php?p=$p&a=$albums[$x]&i=$displayfile&full=$fullfile&path=$encodedpath'><img src='http://images.myphotoalbum.com/$albumpath/albums/$albums[$x]/$thumbs[$y]'></a>";
        }

    } // for x

} else if ( isset($HTTP_GET_VARS['i']) ) {
    $i = $HTTP_GET_VARS['i'];
    $p = $HTTP_GET_VARS['p'];
    $a = $HTTP_GET_VARS['a'];
    $path = $HTTP_GET_VARS['path'];
    $fullfile = $HTTP_GET_VARS['full'];

    $id = preg_replace('/sized\./', '', $i);
    $id = preg_replace('/\.....?$/', '', $id);
    //echo "<h2>$i $id</h2>";
    //echo "<h2>$p $a $i $path</h2>\n";
    $url = "$imgserver/$path/albums/$a/$i";
    //echo "<h3>$url</h3>\n";

    echo "<a href='/foo.php?p=$p&a=$a'>up to this album</a> | ";
    echo "<a href='http://$p.myphotoalbum.com/view_photo.php?set_albumName=$a&id=$id'>go to the mpa site</a><p>";

    if ($fullfile != '') {
        echo "<a href='$imgserver/$path/albums/$a/$fullfile'><img src='$url'></a>";
    } else {
        echo "<img src='$url'>\n";
    }

} else if ( isset($HTTP_GET_VARS['a']) ) {

    // display all thumbnails for a given site.
    // hyperlink them to the sized photo

    $p = $HTTP_GET_VARS['p'];
    $a = $HTTP_GET_VARS['a'];
    $albumdir = makealbumdir($p);
    echo "<a href='http://$_SERVER[HTTP_HOST]/foo.php?p=$p'>up to all albums</a> | \n";
    echo "<a href='http://$_SERVER[HTTP_HOST]/foo.php?z=$p'>all thumbs this site</a><br>\n";
    echo "scanning '$albumdir'<p>";
    $albumpath = makealbumpath($p);
    $encodedpath = urlencode($albumpath);
    $thumbs = listthumbs($p, $a);

    reset($thumbs);
    for ($x = 0; $x < count($thumbs); $x++) {    
        list($sizedfile, $fullfile, $displayfile) = makefilenames($albumdir, $thumbs[$x]);
        
        //echo "sizedfile: $sizedfile fullfile: $fullfile displayfile: $displayfile<br>\n";
        //echo "<a href='http://images.myphotoalbum.com/$albumpath/albums/$a/$displayfile'><img src='http://images.myphotoalbum.com/$albumpath/albums/$a/$file'></a>";

        echo "<a href='http://$_SERVER[HTTP_HOST]/foo.php?p=$p&a=$a&i=$displayfile&full=$fullfile&path=$encodedpath'><img src='http://images.myphotoalbum.com/$albumpath/albums/$a/$thumbs[$x]'></a>";
    }

} else if (isset($HTTP_GET_VARS['p'])) {

    // just list the albums for the site

    $p = $HTTP_GET_VARS['p'];

    $albums = listalbums($p);
    reset($albums);
    for ($x = 0; $x < count($albums); $x++) {
        echo "<a href='http://$_SERVER[HTTP_HOST]/foo.php?p=$p&a=$albums[$x]'>$albums[$x]</a><br>";
    }

} else {
    echo "Go away.\n";
    exit;
}

?>