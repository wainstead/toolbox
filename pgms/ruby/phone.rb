#!/usr/local/bin/ruby

# regexp to match us/ca phone numbers
# $Id: phone.rb,v 1.1 2007/07/17 19:19:42 swain Exp $

puts "Hello, sailor!"

#r = /\+?([01]-?)?\(?\d\d\d\)?[ -]?\d\d\d[ -]?\d\d\d\d/

r = %r{  
    ^1?     # might start with a 1
    [-\s.]? # separator is either a dash, a space, or a period.
    \(?     # optional parentheses
      \d{3} # area code required
    \)?     # optional parentheses
    [-\s.]? # separator 
      \d{3} # 3-digit prefix
    [-\s.]? # another separator
     \d{4}$ # 4-digit line number
}xi

numbers = [
           "(999) 909 7575",
           "900-987-9876",
           "900.987.9876",
           "1-800-757-8888",
           "1.800.757.8888",
           "1 800 757 8888",
           "1 (800) 757 8888",
           "99-999-9999",
           "18009009898",
           "(345)8766565",
           "1-800-EAT-SHIT"
          ]

for number in numbers
  if r.match(number)
    puts "Yay! #{number}"
  else
    puts "boo! #{number}"
  end
end
