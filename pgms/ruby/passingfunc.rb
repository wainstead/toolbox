#!/usr/bin/env ruby

def takenone
  return 42
end


def takeone(n)
  return n
end

puts takeone 715
puts takenone


def gimme(f)
  puts send(f)
end

def gimme2(f, arg)
  puts send f, arg
end

gimme :takenone
gimme2 :takeone, 667


