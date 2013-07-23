require "spec_helper"

describe Memory do
  context "when asked to remember turn" do
    context "and then asked for last coord" do
      it "should return the coord" do
        coord = double("coord")
        subject.remember_turn(coord)
        subject.last_coord.should eq(coord)
      end
    end
  end
end
