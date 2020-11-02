require 'HTTParty'
require 'Nokogiri'

class Scraper
  attr_accessor :parse_page, :doc

  def initialize
    @doc = HTTParty.get('https://store.nike.com/us/en_us/pw/mens-nikeid-lifestyle-shoes/1k9Z7puZoneZoi3')
    @parse_page = Nokogiri::HTML(@doc)
  end

  def names
    @parse_page.css('.grid-item-info').css('.product-name').css('p').children.map { |name| name.text }.compact
  end

  def prices
    @parse_page.css('.grid-item-info').css('.grid-item-info').css('.product-name').css('span.local').children.map { |price| price.text }.compact
  end

end

scraper = Scraper.new
names = scraper.names
prices = scraper.prices

(0...prices.size).each do |index|
  puts "- - - index #{index + 1} - - -"
  puts "Name: #{names[index]} | Price: #{prices[index]}"
end
