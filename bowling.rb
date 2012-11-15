# bowling.rb
class Bowling

  attr_accessor :bowls

  def initialize
    @frame = 0
    @bowls = Array.new(10) { [] }
  end

  def hit(pins)

    current_frame = @bowls[@frame] << pins

    if @frame >= 1
      previous_frame = @bowls[@frame-1]
      if previous_frame[0] == 10
        previous_frame << pins
      elsif previous_frame.reduce(:+) == 10
        previous_frame << pins
      end
    end

    if @frame >= 2
      if double_strike?
        @bowls[@frame-2] << pins
      end
    end

    if (current_frame.length >= 2) || pins == 10
      @frame += 1
    end

  end

  def score
    @bowls.flatten.reduce { |sum, val| sum + val.to_i }
  end

  def double_strike?
    (@bowls[@frame-1][0] && @bowls[@frame-2][0]) == 10
  end
end
