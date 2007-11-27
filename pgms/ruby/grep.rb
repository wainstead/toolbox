#!/usr/bin/ruby

# $Id: grep.rb,v 1.1 2007/07/31 19:05:27 swain Exp $

# some random hacking examples

# adding to an existing class
class Hash
  def hooha
    puts "hooha"
  end
end

# inheritence. classes must be declared before they are used, unlike
# Perl; i.e. Ruby does not seem to scan the file first. Could be
# wrong.

class Hashy < Hash
  attr_accessor :arb
  attr_reader :greeting
  attr_writer :greeting
end


# use "raise" instead of "die"
/\w/.match(ARGV[0]) or raise "Usage: #{$0} <keyword>"


print "Counting #{ARGV[0]}'s's...\n"
$c = 0 # with a dollar sign it's global


#myhash = {} # could also do "Hash.new" or thereabouts
myhash = Hashy.new


myhash.arb = "arbitrary string of text"
myhash.greeting = "hello sailor!"


open('/home/swain/cvs/LOG.txt').each { |x|
  $c += 1
  if /#{ARGV[0]}/.match(x)

    y = x.split(/\s/)
    #print "#{y[0]} "

    y.each { |z|
      if myhash.key?(z)
        myhash[z] += 1
      else
        myhash[z] = 1
      end
    }
  end
}

# myhash.keys.each { |key|
#   puts "#{key} #{myhash[key]}\n"
# }

print "#{myhash.greeting} it's: #{myhash.arb}\n"
print "amount: #{$c}\n"
myhash.hooha
print "#{ARGV[0]}'s's: #{myhash[ARGV[0]]}\n"
