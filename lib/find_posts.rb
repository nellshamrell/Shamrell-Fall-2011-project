# This will contain the code that find the twitter posts we want to respond to with a dice roll
require 'twitter'

class FindPosts

  def get_today
    now = Time.now
    today = Date.new(now.year, now.month, now.day)
  end

  def find_posts
    today = get_today
    tagged_posts = Twitter.search("#dicerollme", :since => today)
  end

end
