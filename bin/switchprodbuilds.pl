#!/usr/bin/perl

while ($line = <DATA>) {
    chomp $line;
    ($project, $tag) = split /: +/, $line;
    next if $tag eq 'trunk';
    print "cd /home/swain/public_html/projects/${project}_prod; svn switch https://svn.myphotoalbum.com/$project/tags/$tag; ";
}
print "\n";
__END__
mpa_core: R_2009_11_04_terms_and_analytics
mpa_gallery: R_2009_11_04_plr_video
mpa_cart: R_2009_11_04_support_link_update
mpa_products: R_2009_11_04_typo_lesbo_strikes_again
