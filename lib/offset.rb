require 'date'

class Offset

  attr_reader :date

  def initialize(date = today_date)
    @date = date
  end

  def today_date
    (Date::today).strftime('%d%m%y')
  end

  def date_squared
    @date.to_i ** 2
  end

  def offset_shift
    date_squared.to_s.chars.last(4).map do |num|
      num.to_i
    end
  end
end
