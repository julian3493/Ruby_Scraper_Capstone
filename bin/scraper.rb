require 'HTTParty'
require 'Nokogiri'

class Scraper
  attr_accessor :parse_page, :doc, :arr
  attr_reader :list

  def initialize
    @doc = HTTParty.get('https://www3.animeflv.net/browse')
    @parse_page = Nokogiri::HTML(@doc)
    @list = @parse_page.css('.ListAnimes').css('.Anime')
    @arr = []
    @list.each do |anime|
      title = anime.css('h3').text
      @arr.push(title)
    end
  end
  def print_title
    @arr.each { |title| puts title }
  end
end

scraper = Scraper.new

scraper.print_title
