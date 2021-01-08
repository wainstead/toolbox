#!/usr/bin/env ruby

# Solving a puzzle from HackerRank... count how many times the hiker
# enters a valley

# Spaces are there for readability; we ignore them during processing
input = "DU UUDD UUUDDD UUDD DU DDDUUU DDUU"

# Initial elevation is sea level
elevation = 0
valleys = 0

input.each_char do |c|
  if c == 'D'
    direction = -1
  elsif c == 'U'
    direction = 1
  elsif c == ' '
    next
  end

  if elevation == 0 and direction == -1
    puts "Entering a valley"
    valleys += 1
  elsif elevation == 0 and direction == 1
    puts "Climbing a mountain"
  end

  elevation += direction

  if elevation == 0
    puts "Returned to sea level"
  end
end

puts "Entered #{valleys} valleys"


def countingValleys(steps, path)
  # Write your code here
  elevation = 0
  direction = 0
  valleys = 0
  
  path.each_char do |c|
    if c == 'U'
      direction = 1
    elsif c == 'D'
      direction = -1    
    end
    if elevation == 0 && direction == -1
      valleys += 1
    end
    elevation += direction
  end
  return valleys
end
