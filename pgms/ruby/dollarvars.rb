#!/usr/bin/env ruby

BEGIN {
  puts "I begin!"

  class Foo
    def initialize
      @name = "easy jet"
    end
    def name
      return @name
    end
  end

  class Bar
    attr_accessor :bwee
    attr_reader :haha
    attr_writer :haha
  end

}
END { puts "End of line." }

puts "Hello, sailor!"

puts "I have #{$,} and #{$;}"

def hello
  puts "need a date?"
end

if defined? hello then puts "yes" else "no" end

hello

# do
#   throw "Sailor boy"
# catch:
#   puts "I caught it"
# end

puts "hello sailor if true" if true

x = 0

while x < 10 do
  x += 1
end
puts "while is done"

begin
  x -= 1
end while x > 0
puts "begin-end-while done"

while true
  x += 1
  break if x > 10
end
puts "while-break done"


f = Foo.new
puts f.name

begin
  x = 42
  if x < 100
    puts "Raising error"
    raise StandardError, "say what"
  end

rescue StandardError
  puts "Caught it"
else
  puts "No errors."
ensure
  puts "Insured."
end
    
mystr = "This is a string that is mine and is a string"
#/mine/ =~ mystr
mat = mystr.match(/that is/)
puts "match before: #{$`}"
puts "match after: #{$'}"
puts "the match itself: #{$&}"
puts "the match object: #{$~} (probably coerced)"
puts "the match object converted to str: #{$~.to_s}"
   
b = Bar.new
b.haha= "haha got set and get"
b.bwee=42
puts "#{b.haha}, #{b.bwee}"
