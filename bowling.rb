# bowling.rb
class Bowling

  attr_accessor :bowls, :frame

  def initialize
    @frame = 0
    @bowls = Array.new(10) { [] }
  end

  def hit(pins)
    if current_frame.nil?
      puts "\nYou've already reached the end of the game."
      return
    end

    current_frame << pins

    if @frame >= 1
      calculate_last_frame(pins)
    end

    if @frame >= 2 && double_strike? && current_frame[1].nil?
      last_last_frame << pins
    end

    if @frame == 9 && (pins == 10 || current_frame.reduce(:+) == 10)
      unless current_frame.length == 3
        return
      end
    end

    if (current_frame.length >= 2) || pins == 10
      @frame += 1 
    end

  end

  def calculate_last_frame(pins)
    if (last_frame[0] == 10) || (last_frame.reduce(:+) == 10)
      last_frame << pins unless last_frame.count == 3
    end
  end

  def score
    @bowls.flatten.reduce { |sum, val| sum + val.to_i }
  end

  def double_strike?
    (last_frame[0] == 10) && (last_last_frame[0] == 10)
  end

  def current_frame
    @bowls[@frame]
  end

  def last_frame
    @bowls[@frame-1]
  end

  def last_last_frame
    @bowls[@frame-2]
  end

end
