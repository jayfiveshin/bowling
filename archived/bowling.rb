# bowling.rb
class Bowling

  attr_accessor :score, :bowls

  def initialize
    @bowls = Array.new(10,[])
    @scores = []
  end

  def hit(pins)
    @bowls << pins
    @scores << pins

    # Checks if last hit resulted in a strike.
    # If it is, skips the next throw by adding a score of zero.
    # The following code: "@scores.index(@scores.last)%2 == 0"
    # ...checks that the last hit was not a second throw.
    if pins == 10 && (@scores.index(@scores.last)%2 == 0)
      @scores << 0
    end
  end

  def score
    @scores.each_index do |i|
      if i%2==0 # First throw in a frame
        if @scores[i] == 10 # Strike
          @scores[i] += (@scores[i+2])
          if @scores[i+2] == 10 # Another strike
            @scores[i] += @scores[i+4]
          else
            @scores[i] += @scores[i+3]
          end
        elsif (@scores[i]+@scores[i+1]) == 10 # Spare
          @scores[i] += @scores[i+2]
        end
      else
        next
      end
    end
    # @scores.reduce(:+) is simpler but it can't handle situations
    # where @scores will have a nil element.
    # nil.to_i will results in 0 therefore the following line can
    # handle situation with both integers and nil values.
    @scores.reduce { |sum, val| sum += val.to_i }
  end

end
