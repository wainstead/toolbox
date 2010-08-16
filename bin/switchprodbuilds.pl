#!/usr/bin/perl

while ($line = <DATA>) {
    chomp $line;
    ($project, $tag) = split /: +/, $line;
    next if $tag eq 'trunk';
    print "cd /home/swain/public_html/projects/${project}_prod; svn switch https://svn.myphotoalbum.com/$project/tags/$tag; ";
}
print "\n";
__END__
mpa_core: R_2010_06_28_secure_login
mpa_gallery: R_2010_06_28_secure_login
mpa_cart: R_2010_06_08_stouffers_mediatree_promotion
mpa_products: R_2010_06_28_secure_login
