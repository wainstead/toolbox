#!/opt/php4/bin/php
<?

// small example of a callback function in php.
// I think i need this for the veracity project.
// $Id: callback.php,v 1.1 2006/01/29 19:44:05 swain Exp $

function foo($arg) {
    $arg("hello sailor");
}

function passed($arg) { echo "$arg\n"; }

echo "gonna hello sailor you:\n";
$myfunc = "passed";
foo( $myfunc );


?>