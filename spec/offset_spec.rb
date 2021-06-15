require_relative 'spec_helper'
require_relative '../lib/offset'

RSpec.describe Offset do
  before :each do
    @offset = Offset.new('130621')
  end

  describe 'Instantiation' do
    it 'exists' do
      expect(@offset).to be_a(Offset)
    end

    it 'has attributes' do
      expect(@offset.date).to eq('130621')
    end
  end

  describe 'Methods' do
    it 'can use today date' do
      allow_any_instance_of(Offset).to receive(:today_date).and_return('140621')

      today_date = Offset.new

      expect(today_date.today_date).to eq('140621')
    end

    it 'can square the date' do
      expect(@offset.date_squared).to eq(17061845641)
    end

    it 'can generate a date shift' do
      expect(@offset.offset_shift).to eq([5, 6, 4, 1])
    end
  end
end
