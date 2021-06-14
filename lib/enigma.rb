require_relative 'encryption'
require_relative 'decryption'

class Enigma

  def encrypt(message, key, date)
    encryption = Encryption.new(message, key, date)
    encryption.initiate_encryption
  end

  def decrypt(message, key, date)
    decryption = Decryption.new(message, key, date)
    decryption.initiate_decryption
  end
end
