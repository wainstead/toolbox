#!/usr/bin/perl

while ($line = <DATA>) {
    chomp $line;
    ($project, $tag) = split /: +/, $line;
    next if $tag eq 'trunk';
    print "cd /home/swain/public_html/projects/${project}_prod; svn switch https://svn.myphotoalbum.com/$project/tags/$tag; ";
}
print "\n";
__END__
mpa_core: R_2010_04_16_no_more_investors_and_navy_tweaks
mpa_gallery: R_2010_04_16_click_counts_back_and_site_optimization
mpa_cart: R_2010_02_24_adding_mediatree
mpa_products: R_2010_03_15_big_product_pop
