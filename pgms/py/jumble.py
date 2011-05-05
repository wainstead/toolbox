#!/usr/bin/env python

import sys
import re

if len(sys.argv) != 2:
    print "usage: %s <word>" % sys.argv[0]
    sys.exit()

swlist = list(sys.argv[1].lower())
swlist.sort()
sortedsearchword = "".join(swlist)

dict_file = open('/usr/share/dict/words')
try:
    for word in dict_file:
        word = word.rstrip()
        if len(word) == 7:
            wordlist = list(word.lower())
            wordlist.sort()
            sortedword = "".join(wordlist)
            if sortedword.lower() == sortedsearchword:
                print "%s IS A MATCH" % word

finally:
    dict_file.close()

