require_relative 'key'
require_relative 'offset'

class Decryption

  attr_reader :message, :char_set

  def initialize(message, key, date)
    @message = message
    @key = Key.new(key)
    @offset = Offset.new(date)
    @char_set = ("a".."z").to_a << " "
  end

  def generate_final_shift
    temp = @key.key_shift.map.with_index do |key, index|
      key + @offset.offset_shift[index]
    end
    temp.map do |num|
      if num < 27
        num
      else
        num % 27
      end
    end
  end

  def split_message
    @message.split("")
  end

  def get_index
    indexed_text = []
    split_message.each do |letter|
      if @char_set.include?(letter)
        indexed_text << @char_set.index(letter)
      else
        indexed_text << letter
      end
    end
    indexed_text
  end

  def sliced
    sliced_text = []
    get_index.each_slice(4).each do |slice|
      sliced_text << slice
    end
    sliced_text
  end

  def decode
    decoded_message = []
    sliced.map do |slice|
      slice.each.with_index do |num, index|
        if !num.is_a?(Integer)
          decoded_message << num
        else
          num -= (generate_final_shift[index].to_i)
          decoded_message << @char_set[num]
        end
      end
    end
    decoded_message
  end

    def decrypted_text
      decode.join
    end
end
