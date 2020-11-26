#!/usr/bin/env perl

use strict; use warnings;

use JSON::PP;
my $json;
{
    undef $/;
    $json = <DATA>;
}

print $json;

my $result = decode_json($json);
print ${$result}{glossary}{title};


__DATA__
{
    "glossary": {
        "GlossDiv": {
            "GlossList": {
                "GlossEntry": {
                    "GlossSee": "markup",
                    "GlossDef": {
                        "GlossSeeAlso": [
                            "GML",
                            "XML"
                        ],
                        "para": "A meta-markup language, used to create markup languages such as DocBook."
                    },
                    "Abbrev": "ISO 8879:1986",
                    "Acronym": "SGML",
                    "GlossTerm": "Standard Generalized Markup Language",
                    "SortAs": "SGML",
                    "ID": "SGML"
                }
            },
            "title": "S"
        },
        "title": "example glossary"
    }
}
