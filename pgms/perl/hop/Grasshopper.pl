#!/usr/bin/perl

# $Id: Grasshopper.pl,v 1.2 2006/05/23 14:17:19 swain Exp $

# the Grasshopper web spider^H^H^H^H^H^H from Higher Order Perl, or HOP

# full final version from the book:
# http://hop.perl.plover.com/Examples/ALL/Grasshopper.pl

use strict;
use warnings;
use HTML::LinkExtor;
use LWP::Simple;
use Iterator_Utils qw(NEXTVAL Iterator);

my $top = 'http://plookfish.myphotoalbum.com/';
my $interesting = sub { grep /^\Qmyphotoalbum.com/o, @_ };

my $urls = traverse($interesting, $top);
print "urls: $urls\n";

my $thing = NEXTVAL($urls);
print "thing: $thing\n";

use File::Basename;

while (my $url = NEXTVAL($urls)) {
    my $file = $url;
    print "doing $file\n";
    $file =~ s/^\Q$top//o;
    my $dir = dirname($file);
    system('mkdir', '-p', ".$dir") == 0 or do { warn "Cannot mkdir '$dir'\n"; next; };
    open F, ">", ".$file" or next;
    print F get($url);
}

print "done.\n";

sub traverse {
    my $interesting_links = sub { @_ };
    $interesting_links = shift if ref $_[0] eq 'CODE';
    my @queue = @_;
    my %seen;

    print "traverse returning an iterator now...\n";

    return Iterator {
        while (@queue) {
            my $url = shift @queue;
            $url =~ s/#.*$//;
            $url =~ s/\.\.//go;
            next if $seen{$url}++;
            
            
            my ($content_type) = head($url) or do { warn "no head for $url\n"; next; };
            if ($content_type =~ m{^text/html\b}) {
                my $html = get($url);
                push @queue, $interesting_links->(get_links($url, $html));
            }
            return $url;
        }
        return; # exhausted
    }
}


sub get_links {
    my ($base, $html) = @_;
    my @links;
    my $more_links = sub {
        my ($tag, %attrs) = @_;
        push @links, values %attrs;
    };

    HTML::LinkExtor->new($more_links, $base)->parse($html);
    return @links;
}

__END__
$Log: Grasshopper.pl,v $
Revision 1.2  2006/05/23 14:17:19  swain
backing up before bork bellies up

Revision 1.1  2006/01/25 21:01:28  swain
This version is one of the earliest in the example in the chapter, but
fascinatingly, already does a breadth first search. The business of
file saving is crufty though; urls with slashes in them don't work so
that needs to be more robust.

What this will not do is login and proceeed to test sites from the
perspective of the logged in user. And of course, with Javascript
you're buggered.

