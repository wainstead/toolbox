#!/usr/bin/env ruby

# Test if a number is a palindrome, i.e. 101, 1441, 224422, etc.
# Just test if the reversed string is identical.

# http://lortza.github.io/2017/09/22/prime-numbers-in-ruby.html
require 'prime'

# thinking about index access...
def is_palindrome2?(n)
  ns = n.to_s
  endidx = ns.length - 1
  offset = 0
  while true
    if offset >= endidx - offset
      return true
    end
    if ns[offset] != ns[endidx - offset]
      return false
    end
    offset += 1
  end
end

# https://medium.com/@PolinaHackTech/7-check-if-string-is-a-palindrome-ruby-app-academy-prep-5faf9f1a4f01
def is_palindrome?(n)
  n == reverse_num(n)
  #is_palindrome2?(n)
end

def reverse_num(num)
 reversed = 0
 until num == 0
   last_digit = num % 10
   reversed = (reversed * 10) + last_digit
   num = num / 10
 end
 reversed
end

# puts is_palindrome? 101 # returns true
# puts is_palindrome? 123 # returns false

# Define a lambda function that will compute palindrome primes up to
# an arbitrary number

# power_array = -> (array_size) do 
#     1.upto(Float::INFINITY).lazy.map { |x| x**power }.first(array_size) 
# end

# print the first n palindrome primes
prime_palindromes = -> (n) do
  pprimes = 1.upto(Float::INFINITY).lazy.select { |p| Prime.prime?(p) && is_palindrome?(p) }.first(n)
end

given = ARGF.read
given.chomp!

x = prime_palindromes.(given.to_i)
#byebug

p x


