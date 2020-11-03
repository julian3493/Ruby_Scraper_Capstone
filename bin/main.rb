#!/usr/bin/env ruby

require_relative '../lib/scraper.rb'
require_relative '../lib/more_info.rb'

def print_data(arr)
  arr.each do |anime|
    puts "Anime Name : #{anime[:title]}"
    puts "Type : #{anime[:type]}"
    puts "Anime URL : #{anime[:url]}"
    puts
  end
end

def print_info(detail)
  puts "Anime Title : #{detail[:title]}"
  puts "Description : #{detail[:description]}"
  puts "Status : #{detail[:status]}"
  puts
end

scraper = Scraper.new('https://www3.animeflv.net/browse')

puts 'Welcome to the animeflv scraper'
puts "Actually there are #{scraper.arr.length} registers, do you want to see the registers?"
puts "PRESS 'y' to see the registers or any other key to exit"
see = gets.chomp

if see == 'y'
  print_data(scraper.arr)
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
    print_info(more.detail)
  end
end

puts 'Thank you for using the Animeflv scraper, Good Bye'
