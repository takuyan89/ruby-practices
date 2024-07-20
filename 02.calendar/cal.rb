#!/usr/bin/env ruby

require 'optparse'
require 'date'

options = {}
opt = OptionParser.new
opt.on('-m', Integer) { |month| options[:month] = month }
opt.on('-y', Integer) { |year| options[:year] = year }
opt.parse!(ARGV)

current_date = Date.today
month = options[:month] || current_date.month
year = options[:year] || current_date.year

puts "      #{month}月 #{year}"
puts "日 月 火 水 木 金 土"

first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)

print "   " * first_day.wday

(first_day..last_day).each do |date|
  print date.day.to_s.rjust(2) + " "
  if date.saturday?
    print "\n"
  end
end

print "\n"
