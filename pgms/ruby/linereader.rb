#!/usr/bin/env ruby

@titles = []

def random_title
  File.readlines('/Users/spawlowski/big.txt').each do |line|
    if line.length < 51 && line.length > 3 && line[0] == '"'
      @titles.push line.gsub('"', '').gsub().chomp
    end
  end
end

random_title
puts @titles
