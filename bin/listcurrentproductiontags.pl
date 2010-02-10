#!/usr/bin/perl



foreach my $project ('mpa_core', 'mpa_gallery', 'mpa_cart', 'mpa_products') {
    my $result = '';
    
    foreach my $line (`svn ls https://svn.myphotoalbum.com/$project/tags  | grep R_2010 | sort`) {
        $result =  $line;
    }
    chomp $result;
    $result =~ s%/$%%;
    print "$project: $result\n";
}


