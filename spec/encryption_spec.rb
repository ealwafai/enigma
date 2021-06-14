require_relative 'spec_helper'
require_relative '../lib/encryption'
require_relative '../lib/key'
require_relative '../lib/offset'

RSpec.describe Encryption do
  before :each do
    @encryption = Encryption.new('Hello World!', '02715', '040895')
  end

  describe 'Instantiation' do
    it 'exists' do
      expect(@encryption).to be_a(Encryption)
    end
  end

  describe 'Methods' do
    it 'can generate final shift' do
      expect(@encryption.generate_final_shift).to eq([3, 0, 19, 20])
    end

    it 'can split message' do
      expect(@encryption.split_message).to eq(["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"])
    end

    it 'can get index based on alphabet' do
      expect(@encryption.get_index).to eq([7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3, "!"])
    end

    it 'can get sliced text' do
      expect(@encryption.sliced).to eq([[7, 4, 11, 11], [14, 26, 22, 14], [17, 11, 3, "!"]])
    end

    it 'can encode' do
      expect(@encryption.encode).to eq(["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w", "!"])
    end

    it 'can join the letters' do
      expect(@encryption.encrypted_text).to eq("keder ohulw!")
    end
  end
end
