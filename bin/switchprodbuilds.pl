#!/usr/bin/perl

while ($line = <DATA>) {
    chomp $line;
    ($project, $tag) = split /: +/, $line;
    next if $tag eq 'trunk';
    print "cd /home/swain/public_html/projects/${project}_prod; svn switch https://svn.myphotoalbum.com/$project/tags/$tag; ";
}
print "\n";
__END__
mpa_cart:     R_2009_06_30_subdomain_free_coupon_support  
mpa_gallery:  R_2009_06_30_bugfixes_and_api_change_support
mpa_products: R_2009_06_30_new_gifterator_products        
mpa_core:     R_2009_06_30_code_reduction                 
