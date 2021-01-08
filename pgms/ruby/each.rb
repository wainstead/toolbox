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
    else
      change = -1
    end
    if elevation == 0 and change == -1
      valleys += 1
    end
  end
  valleys
end

trek = 'UDDDUDUU'
steps = 8

valleys(steps, trek)
