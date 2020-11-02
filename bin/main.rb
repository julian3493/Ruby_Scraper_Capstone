require_relative '../lib/scraper.rb'

require 'HTTParty'
require 'Nokogiri'

scraper = Scraper.new('https://www3.animeflv.net/browse')
scraper.format_data

puts 'Welcome to the animeflv scraper \n \n'
puts "Actually there are #{scraper.arr.length} registers, do you want to see the registers?"
puts "PRESS 'y' to see the registers or any other key to exit"
see = gets.chomp

if see == 'y'
  scraper.print_data

end

puts 'Thank you for using the Animeflv scraper, Good Bye'
