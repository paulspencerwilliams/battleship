require "spec_helper"

describe Strategy do

  let (:priority_cells) {double("priority cells") }
  let (:state)          {double("state")}
  let (:randomizer)     {double("randomizer")}
  let (:suggestion)     {double("suggestion")}
  let (:last_coord)     {double("last_coord")}
  subject               {Strategy.new(priority_cells, randomizer)}

  context "when last turn hits a ship" do
    before (:each) do
      last_coord.stub(:hit?).with(state).and_return(true)
      priority_cells.stub(:add_hit)
    end

    context "and priority cells remains empty" do
      before (:each) do
        priority_cells.stub(:suggestions?).and_return(false)
        randomizer.stub(:suggest_next).with(state).and_return(suggestion)
      end

      it "passes it to priority cells" do
        priority_cells.should_receive(:add_hit).with(last_coord, state)
        subject.suggest_next(last_coord, state)
      end

      it "returns random cell from randomizer" do
        subject.suggest_next(last_coord, state).should eq(suggestion)
      end
    end

    context "and priority cells has suggestions" do
      before (:each) do
        priority_cells.stub(:suggestions?).and_return(true)
        priority_cells.stub(:suggest_next).with(state).and_return(suggestion)
      end

      it "passes it to priority cells" do
        priority_cells.should_receive(:add_hit).with(last_coord, state)
        subject.suggest_next(last_coord, state)
      end

      it "returns cell from priority cells" do
        subject.suggest_next(last_coord, state).should eq(suggestion)
      end 
    end
  end

  context "when last turn misses a ship" do
    before (:each) do
      last_coord.stub(:hit?).with(state).and_return(false)
    end

    context "and priority cells is empty" do
      before (:each) do
        priority_cells.stub(:suggestions?).and_return(false)
        randomizer.stub(:suggest_next).with(state).and_return(suggestion)
      end

      it "returns random cell from randomizer" do
        subject.suggest_next(last_coord, state).should eq(suggestion)
      end
    end

    context "and priority cells has cells" do
      before (:each) do
        priority_cells.stub(:suggestions?).and_return(true)
        priority_cells.stub(:suggest_next).with(state).and_return(suggestion)
      end

      it "returns cell from priority cells" do
        subject.suggest_next(last_coord, state).should eq(suggestion)
      end 
    end
  end
end
