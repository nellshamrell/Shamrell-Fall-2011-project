require_relative "../lib/roller"

describe Roller do
  context "when the user provide a number" do
    it "should return a number greater than 0" do
      roller = Roller.new
      result = roller.roll(6)
      result.should be > 0
    end
    it "should return a return a number less than or equal to the provided number" do
      roller = Roller.new
      result = roller.roll(6)
      result.should be <= 6
    end
  end
end
