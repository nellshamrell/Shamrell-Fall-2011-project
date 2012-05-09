require 'twitter'
require_relative 'attributes'
require_relative 'find_posts'
require_relative 'roller'
require_relative 'make_posts'

class TwitterDiceRoller

  find_posts = FindPosts.new
  make_posts = MakePosts.new

  # Find all posts made today that contain the hashtag #dicerollme
  tagged_posts = find_posts.find_posts 

  # For each post get the user name and die sides
  tagged_posts.each do |post|
    user_name = Attributes.get_user_name(post)
    die_sides = Attributes.get_number_sides(post) 
    unless die_sides == "invalid"
      puts "#{user_name} wants to roll a #{die_sides}-sided die"
      roll = Roller.roll(die_sides)
      status =  "@#{user_name} your roll is #{roll}"
      puts status   
      make_posts.post_status(status)
    end
  end
end
