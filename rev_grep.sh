#!/usr/bin/ksh

# found this via the google:
# http://svn.haxx.se/users/archive-2006-09/1062.shtml

URL=$1
REGEX=$2

LAST_REV="n/a"

svn log -q $URL | perl -ne 'print "$1\n" if /^r(\d+)/' |
while read r
do
##svn cat -r $r $URL | grep "$REGEX" > /dev/null
    BUFFER=`svn cat -r $r $URL | grep "$REGEX"`
    RET=$?
    if [ $RET -eq 0 ]
    then
        echo "Match in revision: $r. Removed in $LAST_REV."
        echo $BUFFER

        exit 0

    elif [ $RET -ne 1 ]
    then
## grep hit an error
        exit 2
    fi

    LAST_REV=$r
done
exit 1 