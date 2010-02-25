#!/usr/bin/perl

while ($line = <DATA>) {
    chomp $line;
    ($project, $tag) = split /: +/, $line;
    next if $tag eq 'trunk';
    print "cd /home/swain/public_html/projects/${project}_prod; svn switch https://svn.myphotoalbum.com/$project/tags/$tag; ";
}
print "\n";
__END__
mpa_core: R_2010_02_24_banned_status_and_mediatree
mpa_gallery: R_2010_02_10_static_content_switch
mpa_cart: R_2010_02_24_adding_mediatree
mpa_products: R_2010_02_24_adding_mediatree
