#!/usr/bin/perl

# Input: the SVN log entries over the range you want to see the diffs
# for. For each pair of consecutive log entries, do svn diff
# -rOLDER:NEWER and dump to a file.

while (<STDIN>) {
    if (/^r(\d+)/) {
        unshift @revisions, $1;
    }
}

for ($x = 0; $x < $#revisions; $x++) {
    print "$revisions[$x]\n";
    $older = $revisions[$x];
    $newer = $revisions[$x + 1];
    system("svn log  -r$newer         > $older-$newer.diff");
    system("svn diff -r$older:$newer >> $older-$newer.diff");
}
