# This will contain the code that will locate the number in the twitter post that we want to assign to the die

require 'twitter'
require_relative 'find_posts'

#
# Here is one way to make a Singleton class with 'static' methods
# 
module Attributes
  extend self
  
  def get_user_name(post)
    user_name = post.from_user
  end

  def get_number_sides(post)
    post_text = post.text
    first_char = post_text[0]
    
    die_num_sides = first_char == "d" ? "#{post_text[1]}#{post_text[2]}".to_i : "invalid"
  end

end
