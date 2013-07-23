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
    let (:suggested_coord) {double("suggested coord")}
    let (:last_turn)       {double("last_turn")}
    let (:state)           {double("state")}
    let (:ships_remaining) {double("ships remaining")}

    subject {PaulPlayer.new(strategy, last_turn)}

    before (:each) do
      strategy.stub(:suggest_next).and_return(suggested_coord)
      last_turn.stub(:remember_turn) 
    end


    it "should ask strategy for suggestion based on last turn" do
      strategy.should_receive(:suggest_next).with(last_turn, state)
      subject.take_turn(state, ships_remaining)
    end

    it "should return the suggested coord" do
      subject.take_turn(state, ships_remaining).should eq(suggested_coord)
    end

    it "should remember turn" do
      last_turn.should_receive(:remember_turn).with(suggested_coord)
      subject.take_turn(state, ships_remaining)
    end

  end
end

