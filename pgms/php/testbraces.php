#!/opt/php5/bin/php
<?php

  // Yes, you can invoke methods in strings, like so:
  // print "{$blip->printFoo()} in there\n";

$foo = "hello, sailor!";
print "{$foo}\n";

class Blippy {
    function printFoo() { 
        if (true) return "hooha";
        else return "foo";
    }
}

$blip = new Blippy();
print "{$blip->printFoo()} in there\n";

?>