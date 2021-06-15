require_relative 'spec_helper'
require_relative '../lib/decryption'
require_relative '../lib/key'
require_relative '../lib/offset'

RSpec.describe Decryption do
  before :each do
    @key = Key.new('02715')
    @date = Offset.new('040895')
    @decryption = Decryption.new('keder ohulw!', @key, @date)
  end

  describe 'Instantiation' do
    it 'exists' do
      expect(@decryption).to be_a(Decryption)
    end
    it 'has attributes' do
      expect(@decryption.key.class).to eq(Key)
      expect(@decryption.date.class).to eq(Offset)
    end
  end

  describe 'Methods' do
    it 'can generate final shift' do
      expect(@decryption.generate_final_shift).to eq([3, 0, 19, 20])
    end

    it 'can split message' do
      expect(@decryption.split_message).to eq(["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w", "!"])
    end

    it 'can get index based on alphabet' do
      expect(@decryption.get_index).to eq([10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22, "!"])
    end

    it 'can get sliced text' do
      expect(@decryption.sliced).to eq([[10, 4, 3, 4], [17, 26, 14, 7], [20, 11, 22, "!"]])
    end

    it 'can decode' do
      expect(@decryption.decode).to eq('hello world!')
    end
  end
end
