#!/usr/bin/perl

# Create an index page of all files from the current directory on down.
# $Id: indexer.pl,v 1.3 2003/02/20 18:49:48 swain Exp $ 

open PIPE, "find . -type f |" or die "Error with the pipe: $!\n";

print <<"EOLN";
<html>
<head>
<title>automagic index page created with $0</title>
</head>
<body>

EOLN

while (<PIPE>) {
    next if /CVS/;
    next if /gif$/;
    chomp;
    s#\./##;
    print "<a href=$_>$_</a>";
    if (/index.htm/) { print " <-- index"; }
    print "<br>\n";
}

# just to be anal...
print "</body></html>\n";
