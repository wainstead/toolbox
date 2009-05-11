#!/usr/bin/perl

use HTML::DOM;
use XML::DOM;

my $other_dom_tree = new HTML::DOM;
$other_dom_tree->parse_file("index.html");

# @trs = $other_dom_tree->getElementsByTagName('tr');
# print scalar(@trs), "\n";

# foreach $tr (@trs) {
#     @tds = $tr->getElementsByTagName('td');
#     print "   ", scalar(@tds), "\n";
#     foreach $node (@tds) {
        
#     }
# }

@tds = $other_dom_tree->getElementsByTagName('td');
print scalar(@tds), "\n";

foreach $td (@tds) {

    my ($url, $caption);

    @img = $td->getElementsByTagName('img');
    if ($img[0]) {
        $image = $img[0]->{src};
        $image =~ s/JPGt/JPG/;
        $url = "http://slim.deasil.com/~swain/redrock/2002/07-04/index/$image";
    }
    @nodes = $td->childNodes();
    foreach $node (@nodes) {
        if ($node->nodeType == XML::DOM::TEXT_NODE) {
            if (length($node->nodeValue)) {
                $caption = $node->nodeValue;
            }
        }
    }
    print "<image>\n   <src>$url</src>\n   <caption>$caption</caption>\n</image>\n";
}

# ->getNodeType() == XML::DOM::TEXT_NODE
__END__
