#!/usr/bin/env ruby

stringy = "I am the perfect picture of a perfect major general"
puts stringy.tr!("abcdefghijklmnopqrstuvwxyz", "nopqrstuvwxyzabcdefghijklm")

n = 10

puts (1..n).reduce(0) { |sum, ith| sum += ith }
puts (1..n).reduce(0, :+)
