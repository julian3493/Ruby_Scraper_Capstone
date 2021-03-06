require 'httparty'
require 'nokogiri'

# Class Scraper
class Scraper
  attr_accessor :arr
  attr_reader :list, :more_url

  def initialize(url)
    @unparsed_page = HTTParty.get(url)
    @parsed_page = Nokogiri::HTML(@unparsed_page)
    @list = @parsed_page.css('.ListAnimes').css('.Anime')
    format_data
    system 'cls'
  end

  private

  def format_data
    @arr = []
    @list.each do |anime|
      hash = {
        title: anime.css('h3').text,
        type: anime.css('.Description').css('.Type').text,
        url: "https://www3.animeflv.net/#{anime.css('.Button')[0]['href']}"
      }
      @arr.push(hash)
    end
    @arr
  end

  public

  def check_title(string)
    @arr.any? { |hash| @more_url = hash[:url] if hash[:title] == string }
  end
end
