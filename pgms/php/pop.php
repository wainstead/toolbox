#!/opt/php5/bin/php
<?php

$foo = array('swain', 'fortunecity', 'com');
$bar = array('swain', 'fortunecity', 'co', 'uk');

print $foo[-1] . "\n";
print $bar[-1] . "\n";

// get the "sitecode"
print array_pop($foo) . "\n";
print array_pop($bar) . "\n";

// get the username
print array_shift($foo) . "\n";
print array_shift($bar) . "\n";
?>