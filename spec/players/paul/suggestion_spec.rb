require "spec_helper" 

describe Suggestion do
  subject {Suggestion.new(4,7)}
  let (:state) {Array.new(10) { Array.new(10) {:unknown}}}

  describe "when initialised" do
    it "should expose x correctly" do
      subject.x.should eq(4)
    end
    it "should expose y correctly" do
      subject.y.should eq(7)
    end
    it "should expose coord correctly" do
      subject.coord.should eq([4,7])
    end
  end

  describe "when asked whether it hit on a given board state" do
    context "and it was a hit" do
      it "should return true" do
        state[4][7] = :hit
        subject.hit?(state).should be_true
      end
    end
    context "and it was a miss" do
      it "should return false" do
        state[4][7] = :miss
        subject.hit?(state).should be_false
      end
    end
    context "and it was unknown" do
      it "should return false" do
        state[4][7] = :unknown
        subject.hit?(state).should be_false
      end
    end
  end
end
