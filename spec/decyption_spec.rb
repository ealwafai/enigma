require_relative 'spec_helper'
require_relative '../lib/decryption'
require_relative '../lib/key'
require_relative '../lib/offset'

RSpec.describe Decryption do
  before :each do
    @decryption = Decryption.new('keder ohulw!', '02715', '040895')
  end

  describe 'Instantiation' do
    it 'exists' do
      expect(@decryption).to be_a(Decryption)
    end

    it 'has attributes' do
      expect(@decryption.message).to eq('keder ohulw!')
      expect(@decryption.key).to eq('02715')
      expect(@decryption.date).to eq('040895')
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
      expect(@decryption.decode).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"])
    end

    it 'can join the letters' do
      expect(@decryption.decrypted_text).to eq('hello world!')
    end
  end
end
