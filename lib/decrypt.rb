require_relative 'enigma'


handle = File.open(ARGV[0], "r")
incoming = handle.read
enigma = Enigma.new
decrypted = enigma.decrypt(incoming)

writer = File.open(ARGV[1], "w")
write.write(decrypted[:decryption])
writer.close
puts "Create '#{ARGV[1]}' with the key #{decrypted[:key]} and the date #{decrypted[:date]}"
