require "spec_helper" 

describe Randomizer do
  describe "when asked for the next suggestion" do
    let(:options) {[:unknown, :hit, :miss].cycle}
    let(:state)   {Array.new(10) {Array.new(10) {options.next}}}

    it "repeatedly returns suggestions with unknown state" do 
      100.times do  
        coord = subject.suggest_next(state)
        state[coord.x][coord.y].should eq(:unknown)
      end
    end

      
  end
end

