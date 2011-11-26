require 'twitter'
require_relative "../lib/attributes"

describe Attributes do
before (:each) do
  @sample_post = Twitter::Status.new('from_user' => "dicerollme", 'text' => "d6 #dicerollme")
  @sample_post2 = Twitter::Status.new('from_user' => "dicerollme", 'text' => "nahnahnah")
   @sample_post3 = Twitter::Status.new('from_user' => "dicerollme", 'text' => "d20 #dicerollme")
 
end

  context "when evaluating a twitter post" do
    
    attributes = Attributes.new

    it "should be able to extract the user_name from the post" do    
      user_name = attributes.get_user_name(@sample_post)
      user_name.should == "dicerollme"      
    end
  
    it "should return the number of die sides if the first character of the post is 'd'" do
      die_num_sides = attributes.get_number_sides(@sample_post)
      die_num_sides.should == 06
    end

   it "should return a double digit number of die sides if a double digit number is provided" do
      die_num_sides = attributes.get_number_sides(@sample_post3)
      die_num_sides.should == 20 
   end

    it "should return a string of 'invalid' if the first character of the post is not d" do
      die_num_sides = attributes.get_number_sides(@sample_post2)
      die_num_sides.should == "invalid"
    end 
  end
end
