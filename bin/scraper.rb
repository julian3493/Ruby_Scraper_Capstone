require 'HTTParty'
require 'Nokogiri'

class Scraper
  attr_accessor :parse_page
  def initialize
    file = HTTParty.get('http://store.nike.com/us/en_us/pw/mens-nikeid-lifestyle-shoes/1k9Z7puZoneZoi3')
    @parse_page = Nokogiri::HTML(file)
  end
end
