require "spec_helper"

describe PaulPlayer do
  describe "when asked for name" do
    it "returns Paul" do
      subject.name.should eq("Paul")
    end
  end
end
