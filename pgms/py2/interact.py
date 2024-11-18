#!/usr/bin/env python

# Drop into an interactive prompt.

import code
print "Hello sailor!"
x = 10
# you can now type "print x" at the prompt and see the value.
code.interact(local=locals())
