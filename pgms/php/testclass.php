#!/opt/php5/bin/php
<?php

class Foo {

    var $one;
    var $two;

    // constructor
    function Foo($hiccup = "All right, you degenerates!  I want this place evacuated in 20 seconds!") {
        $this->one = $hiccup;
        $this->two = "Does someone from PEORIA have a SHORTER ATTENTION span than me?";
    }

    function glup() {
        echo "hello sailor.\n";
    }
}


$blee = new Foo();
$blah = new Foo("are we having fun yet");

$blee->glup();

echo $blee->one;
echo "\n";

echo $blah->one;
echo "\n";

foreach ($blee as $key => $val) {
    echo "$key\n";
}

$thing = 'Foo';
$burp = new $thing();
print "glupping burp:\n";
$burp->glup();
Foo::glup();
$myfunc = "glup";
$class::$myfunc();


?>