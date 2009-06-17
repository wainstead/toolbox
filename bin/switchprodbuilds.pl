#!/usr/bin/perl

while ($line = <DATA>) {
    chomp $line;
    ($project, $tag) = split /: +/, $line;
    next if $tag eq 'trunk';
    print "cd /home/swain/public_html/projects/mpa_${project}_prod; svn switch https://svn.corp.myphotoalbum.com/mpa_$project/tags/$tag; ";
}
print "\n";
__END__
cart:     R_2009_05_26_bugfixes_galore
core:     R_2009_06_05_not_for_sale_fix
gallery:  R_2009_06_05_search_security_fix
products: R_2009_06_05_multi_photo_upload_gmc
