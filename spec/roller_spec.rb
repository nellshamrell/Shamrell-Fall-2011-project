require_relative "../lib/roller"

describe Roller do

  context "when the user provide a number" do
    it "should return a number greater than 0" do
      subject.roll(6).should be > 0
    end
    it "should return a return a number less than or equal to the provided number" do
      subject.roll(6).should be <= 6
    end
  end

  describe "#roll" do
    
    subject { Roller.new.roll(number) }
    
    let(:number) { 6 }
    
    it "should return a number greater than 0" do
      subject.should > 0
    end
    
    it "should return a number less than or equal to the provided number" do
      subject.should <= 6
    end
    
  end
  
  describe "#roll" do

    subject { Roller.new.roll(number) }
    
    let(:number) { 6 }
    
    it { should > 0 }
    it { should <= 6 }
    
  end
  
end
