require 'HTTParty'
require 'Nokogiri'

class Scraper
  attr_accessor :arr
  attr_reader :list

  def initialize(url)
    @unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
    @list = @parsed_page.css('.ListAnimes').css('.Anime')
  end

  def format_data
    @arr = []
    @list.each do |anime|
      hash = {
        title: anime.css('h3').text, type: anime.css('.Description').css('.Type').text,
        url: "https://www3.animeflv.net/#{anime.css('.Button')[0]['href']}"
      }
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

scraper = Scraper.new('https://www3.animeflv.net/browse')
scraper.format_data
scraper.print_data
