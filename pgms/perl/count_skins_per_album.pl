#!/usr/bin/perl

open INFILE, "skins-per-album.log" or die $!;

while (<INFILE>) {
    chomp;
    $count++;
    @f = split /;;/;
    if ($f[2] eq '') { $f[2] = 'default'; }
    $skins{$f[2]}++;
}

print "count: $count albums\n";

# foreach $key (keys %skins) {
#     print "$key: $skins{$key}\n";
# }

foreach $skin ( sort { $skins{$b} <=> $skins{$a} } keys %skins )
{
    #print "$skin: $skins{$skin}\n";
    $skincount = $skins{$skin};
    write;
}


format STDOUT_TOP =
SKIN                COUNT
.

format STDOUT = 
@<<<<<<<<<<<<<<<<<  @<<<<<<
$skin, $skincount
.
