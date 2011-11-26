require 'twitter'
require_relative 'attributes'
require_relative 'find_posts'
require_relative 'roller'

class Combining

  # Find all posts made today that contain the hashtag #dicerollme
  find_posts = FindPosts.new
  tagged_posts 
  # For each post get the user name
  # For each post get the die sides number
  # For each post make roll
  # Return a string of @user, your roll is result
end
