#!/usr/bin/env ruby


def mything
  puts "hello sailor"
  yield
  puts "need a date?"
end

mything do
  if true
    puts "i see the fleet's in"
  else
    puts "no no no no no"
  end
  puts "block done!"
end

