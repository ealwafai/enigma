require_relative 'spec_helper'
require_relative '../lib/enigma'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  describe 'Instantiation' do
    it 'exists' do
      expect(@enigma).to be_a(Enigma)
    end
  end

  describe 'Methods' do
    it 'encrypts message' do
      expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                  }
      expect(@enigma.encrypt).to eq(expected)
    end

    it 'decrypts message' do
      expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
                  }
      expect(@enigma.decrypt).to eq(expected)
    end
  end
end
