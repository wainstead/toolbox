#!/usr/bin/perl

if ($ARGV[0] eq 'prod') {

} elsif ($ARGV[0] eq 'trunk') {

} else {
    print "usage: $0 [prod|trunk]\n";
    exit;
}

my @projects = ('mpa_core', 'mpa_gallery', 'mpa_cart', 'mpa_products');

my $projectdir = '/home/swain/public_html/projects';
chdir $projectdir;

foreach my $project (@projects) {
    if ($ARGV[0] eq 'trunk') {
        # we are switching to trunk; there should be no _prod directories
        (-d "$projectdir/${project}_prod") && die "Cannot switch to trunk: ${project}_prod exists\n";
        ( ! -d "$projectdir/${project}_trunk") && die "Cannot switch to trunk: ${project}_trunk does not exist\n";
    } else {
        # we are switching builds to the production branches; there should be no _trunk directories
        (-d "$projectdir/${project}_trunk") && die "Cannot switch to trunk: ${project}_trunk exists\n";
        ( ! -d "$projectdir/${project}_prod") && die "Cannot switch to prod: ${project}_prod does not exist\n";
    }
}


foreach my $project (@projects) {
    if ($ARGV[0] eq 'trunk') {
        # we are switching to trunk; move mpa_gallery to mpa_gallery_prod, and mpa_gallery_trunk to mpa_gallery
        `mv ${project} ${project}_prod`;
        `mv ${project}_trunk ${project}`;
    } else {
        # we are switching to prod; move mpa_gallery to mpa_gallery_trunk, and mpa_gallery_prod to mpa_gallery
        `mv ${project} ${project}_trunk`;
        `mv ${project}_prod ${project}`;
    }    
}
