#!/usr/bin/env perl

use Mac::Pasteboard;

($data, $flags) =  pbpaste();
print $data, "\n";
