#!/usr/bin/env ruby

# Use the end of file data handle like Perl's

BEGIN { puts "Script begins..." }
END { puts "\nEnd of line" }

DATA.each_line do |line|
  upline = line.upcase
  puts "Got: #{upline}"
end

# This won't print anything; upline must be out of scope?
puts "Still got upline" if defined? upline

puts "Reference testing..."

x = 42
y = x
x = 420
puts y # y was copied

s1 = "String one"
s2 = s1
s1 = "String two"
puts s2 # again, makes copy; output is 42

class Mystring
  attr_accessor :mystr
end

ms1 = Mystring.new
ms1.mystr="Hello"
ms2 = ms1
ms1.mystr="Sailor"
puts ms2.mystr # By reference; output is "Sailor"

puts ms2.mystr.delete('o').upcase # outputs SAILR
puts "HELO #{ms2.mystr.delete('o').upcase}" # outputs HELO SAILR

__END__
one
two
three
four
five
