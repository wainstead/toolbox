#!/usr/bin/env python

from Cheetah.Template import Template

t = Template(file="cheetahtest.tmpl")

print t

t2 = Template("This is a thing unlike any other thing")
print t2
