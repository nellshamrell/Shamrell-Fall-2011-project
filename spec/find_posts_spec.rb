require 'twitter'
require_relative '../lib/find_posts'

describe FindPosts do
  context "when connecting to Twitter" do
    it "should be able to connect to the Twitter API successfully and recieve a response" do 
      response = Twitter.user("sferik").location
      response.should_not be_nil
    end
  end

  context "when finding posts" do
    it "should find the most recent post with the hashtag #dicerollme" do

    end
  end
end
