# enumerable_spec.rb

require_relative '../lib/scraper.rb'

describe Scraper do
  let(:scraper) { Scraper.new('https://www3.animeflv.net/browse') }
  describe '#format_data' do
    it 'create an array with grouped data' do
      expect(scraper.format_data).to be_a(Array)
    end
  end
end
