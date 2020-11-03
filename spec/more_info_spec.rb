# enumerable_spec.rb

require_relative '../lib/more_info.rb'

describe MoreInfo do
  let(:more_info) { MoreInfo.new('https://www3.animeflv.net/anime/black-clover-tv') }
  describe '#print_info' do
    it 'print the saved data' do
      expect { more_info.print_info }.to output.to_stdout
    end
  end
end
