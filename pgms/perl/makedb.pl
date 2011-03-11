#!/usr/bin/perl

use DBI;

my $dbh = DBI->connect("dbi:SQLite:dbname=/tmp/foo.sqlitedb", "", "");

open DICTIONARY, "/usr/share/dict/words" or die $!;

while ($word = <DICTIONARY>) {
    chomp $word;
    if ($word =~ /^[a-z]{5,6}$/) {
        #print $word, "\n";
        $sortedword = join('', sort(split('', $word)));
        $allwords{$word} = $sortedword;
        $wordcount{$sortedword}++;
    }
}

foreach $word (keys %allwords) {
    if ($wordcount{$allwords{$word}} == 1) {
        #print $allwords{$word}, " ",  $word, "\n";
        $dbh->do("INSERT INTO dictionary VALUES('$allwords{$word}', '$word')");
    }
}

$dbh->disconnect;
