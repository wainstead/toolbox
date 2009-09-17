#!/usr/bin/perl

while ($line = <DATA>) {
    chomp $line;
    ($project, $tag) = split /: +/, $line;
    next if $tag eq 'trunk';
    print "cd /home/swain/public_html/projects/${project}_prod; svn switch https://svn.myphotoalbum.com/$project/tags/$tag; ";
}
print "\n";
__END__
mpa_core: R_2009_08_04_website_classes
mpa_gallery: R_2009_08_04_yellowbox
mpa_cart: R_2009_08_04_new_signup_path
mpa_products: R_2009_08_04_deal_of_the_day
