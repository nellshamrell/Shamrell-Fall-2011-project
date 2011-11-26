require 'twitter'
require_relative 'attributes'
require_relative 'find_posts'
require_relative 'roller'

class Combining

  # Find all posts made today that contain the hashtag #dicerollme
  find_posts = FindPosts.new
  tagged_posts = find_posts.find_posts 
  p tagged_posts
  attributes = Attributes.new 
  roller = Roller.new
  # For each post get the user name
  tagged_posts.each do |post|
    user_name = attributes.get_user_name(post)
    die_sides = attributes.get_number_sides(post) 
    unless die_sides == "invalid"
      puts "#{user_name} wants to roll a #{die_sides}-sided die"
      roll = roller.roll(die_sides)
      puts "@#{user_name} your roll is #{roll}"
    end
  end
end
