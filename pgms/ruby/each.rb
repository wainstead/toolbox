#!/usr/bin/env ruby

h = { :foo => 42, :bar => 66 }

h.each do |k, v|
  puts v
  puts k
end

h.each_value do |v|
  puts v
end

h.each_key do |k|
  puts k
end

def valleys(steps, trek)
  valleys = 0
  elevation = 0
  # If we reach elevation -1, and the previous elevation was zero,
  # then we have entered a valley; the rules guarantee we'll come out
  # of it
  trek.each_char do |step|
    if step == 'U'
      change = 1
    elsif step == 'D'
      change = -1
    else
      puts "elevation at the blank: #{elevation}"
      next
    end

    if elevation == 0 and change == -1
      valleys += 1
    end
    elevation += change
  end
  puts "final elevation: #{elevation}"
  valleys
end

trek = 'UD DDUDUU DDUU DU DU'
steps = 8

puts "We stepped into #{valleys(steps, trek)} valleys"
