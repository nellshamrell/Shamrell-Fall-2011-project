require 'twitter'
require_relative "../lib/find_posts"

describe FindPosts do
  context "when connecting to Twitter" do
    it "should be able to connect to the Twitter API successfully and recieve a response" do 
    response = Twitter.user("sferik").location
    response.should == "California"
    end
  end

  context "when getting today's date" do
    it "should get the correct value for today" do
      finder = FindPosts.new
      finder.get_today.should == Date.today
    end
  end

  context "when the application is searching for posts" do
    it "should find all posts with the hashtag #dicerollme made today"

  end
end
