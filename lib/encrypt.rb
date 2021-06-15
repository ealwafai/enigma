require_relative 'enigma'
require_relative 'key'
require_relative 'offset'
require_relative 'encryption'
require_relative 'decryption'

handle = File.open(ARGV[0], "r")
incoming = handle.read
handle.close

key = Key.new('12345')
date = Offset.new('240885')
encrypt = Encryption.new(incoming, key, date)
decrypt = Decryption.new(encrypt.encode, key, date)
enigma = Enigma.new(key, date, encrypt, decrypt)

writer = File.open(ARGV[1], "w")
writer.write(enigma.encrypt[:encryption])
writer.close

puts "Create '#{ARGV[1]}' with the key #{key.key} and the date #{date.date}"
