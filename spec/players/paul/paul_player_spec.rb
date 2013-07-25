require "spec_helper"

describe PaulPlayer do
  describe "when asked for name" do
    xit "returns Paul" do
      subject.name.should eq("Paul")
    end
  end

  describe "when informed to start a new game" do
    xit "it should use appropriate strategy for placing ships" do
    end

  end

  describe "when invited to take turn" do
    let (:strategy)        {double("strategy")}
    let (:suggestion)      {double("suggested")}
    let (:coord)           {double("coord")}
    let (:memory)          {double("memory")}
    let (:state)           {double("state")}
    let (:last_coord)      {double("last coord")}
    let (:ships_remaining) {double("ships remaining")}

    subject {PaulPlayer.new(strategy, memory)}

    before (:each) do
      memory.stub(:last_coord).and_return(last_coord)
      memory.stub(:remember_turn) 
      suggestion.stub(:coord).and_return(coord)
      strategy.stub(:suggest_next).and_return(suggestion)
    end

    it "should ask strategy for suggestion based on last turn" do
      strategy.should_receive(:suggest_next).with(last_coord, state)
      subject.take_turn(state, ships_remaining)
    end

    it "should return the suggested coord" do
      subject.take_turn(state, ships_remaining).should eq(coord)
    end

    it "should remember the suggest" do
      memory.should_receive(:remember_turn).with(suggestion)
      subject.take_turn(state, ships_remaining)
    end

  end
end

