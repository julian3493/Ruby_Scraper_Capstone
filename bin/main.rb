#!/usr/bin/env ruby

require_relative '../lib/scraper.rb'
require_relative '../lib/more_info.rb'

require 'HTTParty'
require 'Nokogiri'

scraper = Scraper.new('https://www3.animeflv.net/browse')
#scraper.format_data

puts 'Welcome to the animeflv scraper'
puts "Actually there are #{scraper.arr.length} registers, do you want to see the registers?"
puts "PRESS 'y' to see the registers or any other key to exit"
see = gets.chomp

if see == 'y'
  scraper.print_data
  puts 'Do you want to see more information about an anime?'
  puts "PRESS 'y' to see more information or any other key to exit"
  more_info = gets.chomp
  if more_info == 'y'
    valid_name = FALSE
    until valid_name
      puts 'Please Copy and Paste the Anime title'
      anime_title = gets.chomp
      valid_name = scraper.check_title(anime_title)
    end
    more = MoreInfo.new(scraper.more_url)
    more.print_info
  end
end

puts 'Thank you for using the Animeflv scraper, Good Bye'
