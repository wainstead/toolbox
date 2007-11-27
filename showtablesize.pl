#!/opt/perl5/bin/perl

# Given a list of Mysql tables, run select count(*) on all of them.
# Input: mysqlshow -uusername -ppassword database

$USERNAME = 'root';
$PASSWORD = '112233';
$DATABASE = 'relatamail';


while (<STDIN>) {
    chomp;
    next if /Database:/;
    next if / Tables /;
    next if /-----/;
    s/\|//g;
    s/^\s*//;
    s/\s*$//g;
    $table = $_;
    print << "EOLN";
echo "Size of $table:"
mysql -u$USERNAME -p$PASSWORD $DATABASE -e "select count(*) from $table" | perl -ne 'print unless /---|count/'
EOLN
}


__END__
