#!/usr/bin/perl

# search the perl path for a module
# input is in the form of Foo::Bar::Baz

use lib "/opt/v3.com/lib/perl";

exit unless $ARGV[0];
$string = $ARGV[0];

$string =~ s|::|/|g;
$string .= ".pm";

$file = "";

for $path (@INC) {
    #print "testing: $path/$string...\n";
    if (-e "$path/$string") {
        $file = "$path/$string";
        last;
    }
}

if ($file eq "") {
    exit;
} else {
    print "$file";
}
