use strict;


sub loadconfig {
    my $package = $_[0] || 'main';

    our ${"$package::configvar"} = "hello sailor";
    print "in loadconfig: ",  $main::configvar, "\n";
          
}


