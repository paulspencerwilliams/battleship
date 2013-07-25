require "spec_helper"

describe PriorityCells do

  let (:stack) {double("stack")}
  let (:state) {Array.new(10) { Array.new(10) {:unknown}}}
  subject      {PriorityCells.new(stack)}

  describe "when registering a hit" do
    before (:each) do
      stack.stub(:push)
    end

    context "in the middle of the board" do
      context "and all neighbours are unknown" do
        it "should add northern neighbour to stack" do
          stack.should_receive(:push).with([5,4])
          subject.add_hit(Suggestion.new(5,5), state)
        end

        it "should add eastern neighbour to stack" do
          stack.should_receive(:push).with([6,5])
          subject.add_hit(Suggestion.new(5,5), state)
        end

        it "should add southern neighbour to stack" do
          stack.should_receive(:push).with([5,6])
          subject.add_hit(Suggestion.new(5,5), state)
        end

        it "should add western neighbour to stack" do
          stack.should_receive(:push).with([4,5])
          subject.add_hit(Suggestion.new(5,5), state)
        end

      end
    end
    context "on a boundary" do
      it "should not suggest out of northern boundary" do
        stack.should_not_receive(:push).with([5,-1])
        subject.add_hit(Suggestion.new(5,0), state)
      end
      it "should not suggest out of eastern boundary" do
        stack.should_not_receive(:push).with([10,5])
        subject.add_hit(Suggestion.new(9,5), state)
      end
      it "should not suggest out of southern boundary" do
        stack.should_not_receive(:push).with([5,10])
        subject.add_hit(Suggestion.new(5,9), state)
      end
      it "should not suggest out of western boundary" do
        stack.should_not_receive(:push).with([-1,5])
        subject.add_hit(Suggestion.new(0,5), state)
      end
    end 
    context "when neighbour is hit" do
      before (:each) do
        state[5][4] = :hit
        state[6][5] = :hit
        state[5][6] = :hit
        state[4][5] = :hit
      end
      it "should not add a northern neighbour that's already hit" do
        stack.should_not_receive(:push).with([5,4])
        subject.add_hit(Suggestion.new(5,5), state)
      end
      it "should not add a eastern neighbour that's already hit" do
        stack.should_not_receive(:push).with([6,5])
        subject.add_hit(Suggestion.new(5,5), state)
      end
      it "should not add a southern neighbour that's already hit" do
        stack.should_not_receive(:push).with([5,6])
        subject.add_hit(Suggestion.new(5,5), state)
      end
      it "should not add a western neighbour that's already hit" do
        stack.should_not_receive(:push).with([4,5])
        subject.add_hit(Suggestion.new(5,5), state)
      end
    end
    context "when neighbour is miss" do
      before (:each) do
        state[5][4] = :miss
        state[6][5] = :miss
        state[5][6] = :miss
        state[4][5] = :miss
      end
      it "should not add a northern neighbour that's already hit" do
        stack.should_not_receive(:push).with([5,4])
        subject.add_hit(Suggestion.new(5,5), state)
      end
      it "should not add a eastern neighbour that's already hit" do
        stack.should_not_receive(:push).with([6,5])
        subject.add_hit(Suggestion.new(5,5), state)
      end
      it "should not add a southern neighbour that's already hit" do
        stack.should_not_receive(:push).with([5,6])
        subject.add_hit(Suggestion.new(5,5), state)
      end
      it "should not add a western neighbour that's already hit" do
        stack.should_not_receive(:push).with([4,5])
        subject.add_hit(Suggestion.new(5,5), state)
      end
    end
  end
  describe "when asked to suggest next" do
    context "and there are suggestions" do
      let (:suggestion) {double("suggestion")}
      it "should return top of suggestion stack" do
        stack.stub(:pop).and_return(suggestion)
        subject.suggest_next.should eq(suggestion)
      end
    end

    context "and there are no suggestions" do
      it "should return nil" do
        stack.stub(:pop).and_return(nil)
        subject.suggest_next.should be_nil
      end
    end
  end
end
