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
      @today_date = (Date::today).strftime('%d%m%y')

      expect(@offset.today_date).to eq(@today_date)
    end

    it 'can square the date' do
      expect(@offset.date_squared).to eq(17061845641)
    end

    it 'can generate a date shift' do
      expect(@offset.offset_shift).to eq([5, 6, 4, 1])
    end
  end
end
