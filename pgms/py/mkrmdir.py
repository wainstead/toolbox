#!/usr/bin/python
import os
import shutil

if not os.path.exists("./tmp"):
    os.mkdir("./tmp")

shutil.rmtree("./tmp")
