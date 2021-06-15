require_relative 'encryption'
require_relative 'decryption'

class Enigma

  attr_reader :key, :date, :encryption, :decryption

  def initialize(key = Key.new, date = Offset.new, encryption, decryption)
    @key = key
    @date = date
    @encryption = encryption
    @decryption = decryption
  end

  def encrypt(message = @encryption.message, key = @key, date = @date)
    return {encryption: @encryption.encode, key: @key.key, date: @date.date}
  end

  def decrypt(message = @decryption.message, key = @key, date = @date)
    return {decryption: @decryption.decode, key: @key.key, date: @date.date}
  end
end
