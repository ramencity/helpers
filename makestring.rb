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

  options[:include_space]
  opts.on('-s', '--space', 'include spacebar characters in string') do |include_space|
    options[:include_space] = include_space
  end

  options[:uppercase]
  opts.on('-u', '--upper', 'include uppercase characters in string') do |uppercase|
    options[:uppercase] = uppercase
  end

  options[:numeral]
  opts.on('-n', '--numerals', 'include numeric characters in string') do |numeral|
    options[:numeral] = numeral
  end

  opts.on('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end
end

# Parse the command-line:
optparse.parse!

##

if options[:length] == nil
  puts "Please enter the desired string length."
  options[:length] = gets.chomp
end

alphabet = ('a'..'z').to_a

if options[:include_space]
  alphabet.push(' ')
end

if options[:uppercase]
  ('A'..'Z').each do |e|
    alphabet.push(e)
  end
end

if options[:numeral]
 (0..9).each do |e|
    alphabet.push(e)
  end
end

array = []

options[:length].to_i.times { array.push(alphabet.sample) }

puts "\n" + array.join + "\n\n"
