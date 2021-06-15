require_relative 'enigma'
require_relative 'key'
require_relative 'offset'
require_relative 'encryption'
require_relative 'decryption'

handle = File.open(ARGV[0], "r")
incoming = handle.read
handle.close

key = Key.new(ARGV[2])
date = Offset.new(ARGV[3])
encrypt = Encryption.new('Hello', key, date)
decrypt = Decryption.new(incoming, key, date)
enigma = Enigma.new(key, date, encrypt, decrypt)

writer = File.open(ARGV[1], "w")
writer.write(decrypt.decode)
writer.close

puts "Created '#{ARGV[1]}' with the key #{key.key} and the date #{date.date}"
