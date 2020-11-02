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
      hash = {
        title: anime.css('h3').text, type: anime.css('.Description').css('.Type').text,
        url: "https://www3.animeflv.net/#{anime.css('.Button')[0]['href']}"}
      @arr.push(hash)
    end
  end

  def print_data
    @arr.each do |anime|
      puts "Anime Name : #{anime[:title]}"
      puts "Type : #{anime[:type]}"
      puts "Anime URL : #{anime[:url]}"
      puts
    end
  end
end

scraper = Scraper.new

scraper.print_data
