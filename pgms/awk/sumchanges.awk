# List the number of lines added and deleted per file, and sum those
# numbers

# usage:
# git diff --numstat origin/master HEAD|awk -f ~/toolbox/pgms/awk/sumchanges.awk

BEGIN {
    added = 0;
    removed = 0;
    print "Added, removed, filename";
}

{
    added += $1;
    removed += $2;
    print;
}

END {
    print added"\t"removed"\tTotal added, removed"
}
