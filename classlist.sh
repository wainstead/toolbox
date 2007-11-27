#!/bin/bash

# Martin Hebrank's script to list all classes in the path.
# $Id: classlist.sh,v 1.1 2002/12/05 16:18:33 swain Exp $

NEWPATH=`echo $CLASSPATH | sed 's/:/ /g'`

# echo $NEWPATH

for x in $NEWPATH
  do
  if [ -d $x ]; then
      echo Class Directory Structure: $x
      pushd $x > /dev/null
      find . -name "*.class" | cut -c3-
      popd > /dev/null
  else

      echo Class Java Archive: $x

# unzip -qq prevents all headers from being written. I'll take care of that.
# 59 is the start of the filename. that's all we care about.
      unzip -vqq $x | cut -c 59-

  fi
done