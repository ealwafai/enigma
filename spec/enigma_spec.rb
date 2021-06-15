require_relative 'spec_helper'
require_relative '../lib/enigma'
require 'date'


RSpec.describe Enigma do
  before :each do
    @key = Key.new("02715")
    @date = Offset.new("040895")
    @encryption = Encryption.new("hello world", @key, @date)
    @decryption = Decryption.new(@encryption.encode, @key, @date)
    @enigma = Enigma.new(@key, @date, @encryption, @decryption)
  end

  describe 'Instantiation' do
    it 'exists' do
      expect(@enigma).to be_a(Enigma)
    end
  end
  it 'has attributes' do
    expect(@enigma.key.class).to eq(Key)
    expect(@enigma.date.class).to eq(Offset)
    expect(@enigma.encryption.class).to eq(Encryption)
    expect(@enigma.decryption.class).to eq(Decryption)
  end
  describe 'Methods' do
    it 'encrypts message' do

      expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                  }
      expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    end

    it 'decrypts message' do
      expected = {
                  decryption: "hello world",
                  key: "02715",
                  date: "040895"
                  }
      expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end
  end
end
