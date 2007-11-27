#!/usr/bin/perl -w

chdir '/home/swain/cvs/pgms/perl';

open PIPE, "mysql -S /tmp/mysql.mpa.sock --batch --silent -uroot mpa -e 'select username from users where status <> 0' |" or die $!;

while (<PIPE>) {
    chomp;
    system("./verify.pl $_");
}
