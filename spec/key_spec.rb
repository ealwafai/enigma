require_relative 'spec_helper'
require_relative '../lib/key'

RSpec.describe Key do
  before :each do
    @key = Key.new('12121')
  end

  describe 'Instantiation' do
    it 'exists' do
      expect(@key).to be_a(Key)
    end

    it 'has attributes' do
      expect(@key.key).to eq('12121')
    end
  end

  describe 'Methods' do
    it 'can generate a random key' do
      random_key = Key.new()
      expect(random_key.generate_key).to be_a(String)
      expect(random_key.generate_key.length).to eq(5)
    end

    it 'can create a key_shift' do
      expect(@key.key_shift).to eq([12, 21, 12, 21])
    end
  end
end
