require_relative 'enigma'

handle = File.open(ARGV[0], "r")
incoming = handle.read
enigma = Enigma.new
encrypted = enigma.encrypt(incoming)

writer = File.open(ARGV[1], "w")
write.write(encrypted[:encryption])
writer.close
puts "Create '#{ARGV[1]}' with the key #{encrypted[:key]} and the date #{encrypted[:date]}"
