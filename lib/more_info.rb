require 'HTTParty'
require 'Nokogiri'

class MoreInfo

  def initialize(url)
    upd_page = HTTParty.get(url)
    pd_page = Nokogiri::HTML(upd_page)
    @detail = {
      title: pd_page.css('h1').text
    }
  end
end