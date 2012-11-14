require_relative '../bowling.rb'

describe Bowling, "#score" do

  before(:each) do
    @bowling = Bowling.new
  end

  it "should return 0 for all gutter game" do
    20.times { @bowling.hit 0 }
    @bowling.score.should eq 0
  end

  it "should return a score of 1 if only one pin hit" do
    @bowling.hit 1
    19.times { @bowling.hit 0 }
    @bowling.score.should eq 1
  end

  it "should return a score of 10 if five pins hit two times" do
    2.times  { @bowling.hit 5 }
    18.times { @bowling.hit 0 }
    @bowling.score.should eq 10
  end

  it "should know how to handle getting a spare" do
    2.times  { @bowling.hit 5 }
    @bowling.hit 4
    17.times { @bowling.hit 0 }
    @bowling.score.should eq (14 + 4)
  end

  it "should know how to handle getting a strike" do
    @bowling.hit 10
    2.times  { @bowling.hit 4 }
    16.times { @bowling.hit 0 }
    @bowling.score.should eq (10 + 8 + 8)
  end

  it "should know the difference between a spare and a strike" do
    @bowling.hit 0
    @bowling.hit 10
    2.times { @bowling.hit 4 }
    16.times { @bowling.hit 0 }
    @bowling.score.should eq (10 + 4 + 8)
  end

  it "should know how to handle getting many spares in a row" do
    18.times { @bowling.hit 5 }
    2.times  { @bowling.hit 0 }
    @bowling.score.should eq (15*8+10)
  end

  it "should know how to handle getting many strikes in a row" do
    9.times do
      @bowling.hit 10
    end
    2.times { @bowling.hit 0 }
    @bowling.score.should eq 240
  end

  # it "should give one more bowl if you get a spare in the last frame" do

  # end

  # it "should give two more bowl if you get a strike in the last frame" do

  # end

  # it "should return 300 for a perfect game" do
  #   20.times { @bowling.hit(10) }
  #   @bowling.score.should eq(300)
  # end
end
