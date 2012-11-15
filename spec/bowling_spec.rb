require_relative '../bowling.rb'

describe Bowling do

  before(:each) do
    @bowling = Bowling.new
  end

  it "should be able to bowl" do
    @bowling.hit(8)
    @bowling.bowls[0][0].should eq(8)
  end

  it "should be able to bowl twice in one frame" do
    @bowling.hit(2)
    @bowling.hit(4)
    @bowling.bowls[0][0].should eq(2)
    @bowling.bowls[0][1].should eq(4)
  end

  it "should be able to tell difference between frames" do
    @bowling.hit(2)
    @bowling.hit(4)
    @bowling.hit(4)
    @bowling.bowls[0][0].should eq(2)
    @bowling.bowls[0][1].should eq(4)
    @bowling.bowls[1][0].should eq(4)
    # @bowling.bowls.should eq("X")
  end

  it "should be able to bowl a full game" do
    20.times { @bowling.hit(4) }
    @bowling.bowls.last.should_not eq([])
    # @bowling.bowls.should eq("X")
  end

  it "should be able to return game score at the end of the game" do
    20.times { @bowling.hit(4) }
    @bowling.score.should eq(80)
    # @bowling.score.should eq("X")
  end

  it "should be able to handle spares" do
    3.times  { @bowling.hit 5 }
    17.times { @bowling.hit 0 }
    @bowling.score.should eq(20)
    # @bowling.score.should eq("X")
  end

  it "should be able to handle strikes with no additional points" do
    @bowling.hit 10
    18.times { @bowling.hit 0 }
    @bowling.score.should eq(10)
  end

  it "should be able to handle strikes with one additional point" do
    @bowling.hit 10
    @bowling.hit 9
    17.times { @bowling.hit 0 }
    @bowling.score.should eq(28)
    # @bowling.bowls.should eq("X")
  end

  it "should be able to handles strikes with two additional points" do
    @bowling.hit 10
    2.times  { @bowling.hit 4 }
    16.times { @bowling.hit 0 }
    @bowling.score.should eq(26)
    # @bowling.bowls.should eq("X")
  end

  it "should be able to handle multiple spares" do
    6.times  { @bowling.hit 5 }
    14.times { @bowling.hit 0 }
    @bowling.score.should eq(40)
  end

  it "should be able to handle double strikes" do
    2.times  { @bowling.hit 10 }
    16.times { @bowling.hit 0  }
    @bowling.score.should eq(30)
  end

  it "should be able to handle double strikes and a single" do
    2.times  { @bowling.hit 10 }
    @bowling.double_strike?.should eq(true)
    @bowling.hit 9
    15.times { @bowling.hit 0  }
    @bowling.bowls.should eq("X")
    @bowling.score.should eq(57)
  end

  # it "should be able to handle turkeys" do
  #   3.times  { @bowling.hit 10 }
  #   14.times { @bowling.hit 0  }
  #   @bowling.bowls.should eq("X")
  #   @bowling.score.should eq(60)
  # end

end
