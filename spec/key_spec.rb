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
    it 'can create a key_shift' do
      expect(@key.key_shift).to eq([12, 21, 12, 21])
    end
  end

  describe 'key with default value' do
    it 'can generate a random key' do
      allow_any_instance_of(Key).to receive(:generate_key).and_return('12345')

      random_key = Key.new

      expect(random_key.key).to eq('12345')
      expect(random_key.key.length).to eq(5)
    end

    it 'can generate key shift' do
      allow_any_instance_of(Key).to receive(:generate_key).and_return('12345')

      random_key = Key.new

      expect(random_key.key_shift).to eq([12, 23, 34, 45])
    end
  end
end
