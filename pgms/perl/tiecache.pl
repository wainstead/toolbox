#!/opt/local/bin/perl

use Tie::Cache;
print "Hello, sailor!\n";

# personalize the Tie::Cache object, by inheriting from it
package My::Cache;
@ISA = qw(Tie::Cache);

# override the read() and write() member functions
# these tell the cache what to do with a cache miss or flush
sub read { 
    my($self, $key) = @_; 
    print "cache miss for $key, read() data\n";
    rand() * $key; 
}
sub write { 
    my($self, $key, $value) = @_;
    print "flushing [$key, $value] from cache, write() data\n";
}

my $cache_size   = $ARGV[0] || 2;
my $num_to_cache = $ARGV[1] || 4;   
my $Debug = $ARGV[2] || 1;

tie %cache, 'My::Cache', $cache_size, {Debug => $Debug};   

# load the cache with new data, each through its contents,
# and then reload in reverse order.
for(1..$num_to_cache) { print "read data $_: $cache{$_}\n" }
while(my($k, $v) = each %cache) { print "each data $k: $v\n"; }
for(my $i=$num_to_cache; $i>0; $i--) { print "read data $i: $cache{$i}\n"; }

# flush writes now, trivial use since will happen in DESTROY() anyway
tied(%cache)->flush(); 

# clear cache in 2 ways, write will flush out to disk
%cache = ();
undef %cache;
