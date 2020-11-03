# enumerable_spec.rb

require_relative '../lib/scraper.rb'

describe Scraper do
  let(:scraper) { Scraper.new('https://www3.animeflv.net/browse') }
  describe '#format_data' do
    # it 'create an array with grouped data' do
    #   expect(scraper.format_data).to be_a(Array)
    # end
    # it 'create an array of hashes' do
    #   expect(scraper.format_data.all? { |item| item.is_a?(Hash) }).to eql(TRUE)
    # end
    it 'raise error for private methods' do
      expect { scraper.format_data }.to raise_error(NoMethodError)
    end
  end
  describe '#print_data' do
    it 'print the saved data' do
      expect { scraper.print_data }.to output.to_stdout
    end
  end
end
