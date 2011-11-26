# This will contain the code that find the twitter posts we want to respond to with a dice roll
require 'twitter'

class FindPosts

  def find_posts
    tagged_posts = Twitter.search("#dicerollme", :rpp => 1, :result_type => "recent")
  end

end
