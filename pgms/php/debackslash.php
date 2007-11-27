#!/opt/php5/bin/php
<?php

$x[0] = "O\'Connor";
$x[1] = "830 Coleman\'s Island Road";


$x[0] = removeBackslashes($x[0]);
$x[1] = removeBackslashes($x[1]);

$y = serialize($x);print "$y\n";

$z = unserialize($y);

print "$z[0]\n";
print "$z[1]\n";


function removeBackslashes($string) {
    return preg_replace('/\\\/', '', $string);
}

?>