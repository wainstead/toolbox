#!/usr/bin/perl

while ($line = <DATA>) {
    chomp $line;
    ($project, $tag) = split /: +/, $line;
    next if $tag eq 'trunk';
    print "cd /home/swain/public_html/projects/mpa_${project}_prod; svn switch https://svn.myphotoalbum.com/mpa_$project/tags/$tag; ";
}
print "\n";
__END__
cart:     R_2009_06_19_mcafee_markings
core:     R_2009_06_19_additional_products_and_mcafee
gallery:  R_2009_06_15_facebook_app_and_gallery_class
products: R_2009_06_19_additional_products_and_mcafee
