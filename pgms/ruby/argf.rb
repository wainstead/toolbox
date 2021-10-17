#!/usr/bin/env ruby

i = 4
d = 4.0
s = 'HackerRank '

ARGF.each_with_index do |line, idx|
  line.chomp!
  case idx
  when 0
    puts i + Integer(line)
  when 1
    puts d + Float(line)
  when 2
    puts s + line
  end
end
