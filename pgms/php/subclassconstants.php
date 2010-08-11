#!/opt/php5/bin/php
<?php


class Foo {

    //const hippy = "This is the parent constant.";
    
    function myprint() {
        print self::hippy;
        print "\n";
    }
    
  }

class Bar extends Foo {
    const hippy = "I am the son of Foo.";
}


$bar = new Bar();
$bar->myprint();