#!/usr/bin/env ruby

require 'mail'
require 'optparse'

#Command-line options:

options = {}

optparse = OptionParser.new do |opts|
#banner at top of HELP screen:
  opts.banner = 'Usage: readmail.rb [options]'

  options[:addressee]
  opts.on('-a ADDRESSEE', '--addressee ADDRESSEE', 'Email of addressee to search for.   Return all emails if blank') do |addressee|
    options[:addressee] = addressee
  end

  opts.on('-h', '--help', 'Display this screen') do
    puts opts
    exit
  end
end

# Parse the command-line:
optparse.parse!

maildir = Dir.home + '/.sgt/radar.net/radar.net/mail/*'

Dir[maildir].each do |msg|
  mail = Mail.read(msg)
  mail.parts.map { |p|
    if p.content_type == 'text/plain'
      if options[:addressee] == nil || mail.to.to_s.include?(options[:addressee])
        puts "\nAddressee is: #{mail.to}\n"
        puts "Subject is: #{mail.subject}\n"
        puts p.body.decoded
        puts "\n\n=========END OF EMAIL=========\n\n"
    end
  end
}
end
