# enumerable_spec.rb

require_relative '../lib/scraper.rb'

describe Scraper do
  let(:scraper) { Scraper.new('https://www3.animeflv.net/browse') }
  describe '#format_data' do
    it 'raise error for private methods' do
      expect { scraper.format_data }.to raise_error(NoMethodError)
    end
  end
  
  describe '#check_title' do
    it 'return TRUE if the Title given is into the data' do
      expect(scraper.check_title('Munou na Nana')).to eql(TRUE)
    end
    it 'return FALSE if the Title given is not into the data' do
      expect(scraper.check_title('Title not included')).to eql(FALSE)
    end
  end
end
