#!/usr/bin/env ruby
# coding: utf-8

# Enter your code here
def mask_article(mystring, words)
  words.each do |word|
    mystring = mystring.gsub(word, strike(word))
  end
  mystring
end

def strike(word)
  "<strike>#{word}</strike>"
end

puts mask_article("This is my article, and it's good", ["article", "good"])

def full_name(firstname, *nameparts)
  puts firstname +  " " + nameparts.join(" ")
end
  
puts full_name("steve", "wainstead", "was" , "here")

def sockMerchant(n, ar)
    h = Hash.new(0)
    ar.each { |sock| h[sock] += 1 }
    
    pairs = 0

    h.each_value { |v| pairs += v / 2 }

    return pairs
end


__END__
Celsius, Kelvin, and Fahrenheit Temperature Conversions
Celsius to Fahrenheit	° F = 9/5 ( ° C) + 32
Fahrenheit to Celsius	° C = 5/9 (° F - 32)
Celsius to Kelvin	K = ° C + 273
Kelvin to Celsius	° C = K - 273
Fahrenheit to Kelvin	K = 5/9 (° F - 32) + 273
