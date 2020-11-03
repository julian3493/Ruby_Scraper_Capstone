require 'httparty'
require 'nokogiri'

# Class MoreInfo
class MoreInfo
  def initialize(url)
    upd_page = HTTParty.get(url)
    pd_page = Nokogiri::HTML(upd_page)
    @detail = {
      title: pd_page.css('h1').text,
      description: pd_page.css('.Description').css('p').text,
      status: pd_page.css('.fa-tv').text
    }
    system 'cls'
  end

  def print_info
    puts "Anime Title : #{@detail[:title]}"
    puts "Description : #{@detail[:description]}"
    puts "Status : #{@detail[:status]}"
    puts
  end
end
