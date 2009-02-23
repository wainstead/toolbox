

sub loadconfig {
    my $package = $_[0] || 'main';
    print "package: $package\n";
    $package::configvar = "hello sailor";
    print "in loadconfig: ",  $package::configvar, "\n";
          
}



1;
