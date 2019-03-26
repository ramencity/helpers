#!/usr/bin/env ruby

require 'optparse'

#Command-line options:

options = {}

optparse = OptionParser.new do |opts|
#banner at top of HELP screen:
  opts.banner = 'Usage: makestring.rb [options]'

  options[:length]
  opts.on('-l LENGTH', '--length LENGTH', 'length of string to make') do |length|
    options[:length] = length
  end

  options[:no_space]
  opts.on('--nospace', 'string has no spaces in it; defaults to a string with spaces inserted') do |no_space|
    options[:no_space] = no_space
  end

  options[:uppercase]
  opts.on('-u', '--upper', 'include uppercase characters in string') do |uppercase|
    options[:uppercase] = uppercase
  end

  options[:numeral]
  opts.on('-n', '--numerals', 'include numeric characters in string') do |numeral|
    options[:numeral] = numeral
  end

  options[:numbers_only]
  opts.on('--int', 'return a string of numbers only') do |numbers_only|
    options[:numbers_only] = numbers_only
  end

  opts.on('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end
end

# Parse the command-line:
optparse.parse!

total = options[:length].to_i

if total == 0
  puts "Please enter the desired string length."
  total = gets.chomp.to_i
end

alphabet = options[:numbers_only] ? ('0'..'9').to_a : ('a'..'z').to_a

if options[:uppercase]
  ('A'..'Z').each do |e|
    alphabet.push(e)
  end
end

if options[:numeral]
  (0..9).each do |e|
    alphabet.push(e) 
  end #defining 'alphabet'

  array = []

  if options[:no_space]
    total.times {array.push(alphabet.sample)}
  else
    i = 0
    while i < total
      char_count = (4..10).to_a.sample
      word_size = char_count < (total - i) ? char_count : (total - i)
      word_size.times {array.push(alphabet.sample)}
      i += word_size
      if i < total
        if i == (total - 1)
          array.push(alphabet.sample)
        else
          array.push(' ')
        end
        i += 1
      end
    end
  end

  string = array.join.gsub('kkk', 'qqq') # nazi punks eff off
  puts "\n#{string}\n\n"