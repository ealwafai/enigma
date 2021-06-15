class Key

  attr_reader :key

  def initialize(key = generate_key)
    @key = key
  end

  def generate_key
    5.times.map {(0..9).to_a.sample}.join
  end

  def key_shift
    string = @key.chars.each_cons(2).map do |num|
      num.join
    end
    string.map do |i|
      i.to_i
    end
  end
end
