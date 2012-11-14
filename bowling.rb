# bowling.rb
class Bowling

  attr_accessor :score, :last

  def initialize
    @score = []
  end

  def hit(pins)
    @score << pins

    # Checks if last hit resulted in a strike.
    # If it is, skips the next throw by adding a score of zero.
    # The following code: "@score.index(@score.last)%2 == 0"
    # ...checks that the last hit was not a second throw.
    if pins == 10 && (@score.index(@score.last)%2 == 0)
      @score << 0
    end
  end

  def score
    @score.each_index do |i|
      if i%2==0 # First throw in a frame
        if @score[i] == 10 # Strike
          @score[i] += (@score[i+2])
          if @score[i+2] == 10 # Another strike
            @score[i] += @score[i+4]
          else
            @score[i] += @score[i+3]
          end
        elsif (@score[i]+@score[i+1]) == 10 # Spare
          @score[i] += @score[i+2]
        end
      else
        next
      end
    end
    @score.reduce(:+)
  end

  def scores
    @score
  end

end
