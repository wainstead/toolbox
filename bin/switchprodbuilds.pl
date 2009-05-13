#!/usr/bin/perl

while ($line = <DATA>) {
    chomp $line;
    ($project, $tag) = split /: +/, $line;
    next if $tag eq 'trunk';
    print "cd /home/swain/public_html/projects/mpa_${project}_prod; svn switch https://svn.corp.myphotoalbum.com/mpa_$project/tags/$tag\n";
}

__END__
cart:     R_2009_05_13_mass_cleanup_deux
core:     R_2009_05_13_new_header_footer
gallery:  R_2009_05_13_this_years_redesign
products: R_2009_05_13_gifterator
signup:   trunk
www:      trunk
