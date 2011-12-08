require 'twitter'
require_relative "../lib/attributes"

describe Attributes do

  # By default the `subject` of the test will be:
  # subject { Attributes.new }

  describe "#get_user_name" do
    
    # However, you can override it and even have it be the result of a method call...
    subject { Attributes.new.get_user_name(post) }
    
    # This post value is automatically inserted above into the subject
    let(:post) { Twitter::Status.new 'from_user' => expected_username, 'text' => "d6 #dicerollme" }
    
    # This here makes it absolutely clear what you are expecting in the test.
    let(:expected_username) { "dicerollme" }
    
    # This is a shortcut notation for RSpec
    it { should == expected_username }

  end

  describe "#get_number_of_sides" do

    subject { Attributes.new.get_number_sides(post) }

    context "when given a single digit side value" do

      let(:post) { Twitter::Status.new('from_user' => "dicerollme", 'text' => "d#{expected_sides} #dicerollme") }

      let(:expected_sides) { 6 }
      
      it "should return the correct number of sides" do
        subject.should == expected_sides
      end
      
    end
    
    context "when given a double digit side value" do
      
      let(:post) { Twitter::Status.new('from_user' => "dicerollme", 'text' => "d#{expected_sides} #dicerollme") }

      let(:expected_sides) { 20 }
      
      it "should return the correct number of sides" do
        subject.should == expected_sides
      end

    end
    
    context "when given an invalid side value" do

      let(:post) { Twitter::Status.new('from_user' => "dicerollme", 'text' => "nahnahnah") }
      
      let(:expected_sides) { "invalid" }
      

      it "should return that it is not valid" do
        subject.should == expected_sides
      end

    end

  end

end



# Or you can even used shared examples if you had multiple characteristics that
# you needed to check across various inputs. Look below to see an example.
shared_examples "a correctly specified die value" do
  
  it "should return the correct number of sides" do
    subject.get_number_sides(post).should == expected_sides
  end

end


describe Attributes do
  
  describe "#get_number_of_sides" do

    context "when given a single digit value" do
      
      let(:post) { Twitter::Status.new('from_user' => "dicerollme", 'text' => "d#{expected_sides} #dicerollme") }
      let(:expected_sides) { 20 }
      
      it_should_behave_like "a correctly specified die value"
      

    end

  end
  
end

