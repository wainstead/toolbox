<?php
  /**
   * This is the index page I use to list all the pages output by lhhreplay.pl.
   */
?>

<h3>List of files from the most recent run of lhhrerun.pl:</h3>
<?php

$dir = './trials/';

// Open a known directory, and proceed to read its contents
if (is_dir($dir)) {
    if ($dh = opendir($dir)) {
        while (($file = readdir($dh)) !== false) {
            //echo "filename: $file : filetype: " . filetype($dir . $file) . "\n";
            if (preg_match('/error/', $file)) {
                echo "<a href=" . "$dir$file" . ">$file</a> <font color=red>ERROR</font><br>\n";
            } else {
                echo "<a href=" . "$dir$file" . ">$file</a><br>\n";
            }
        }
        closedir($dh);
    }
}

?>