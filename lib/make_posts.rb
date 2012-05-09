require 'twitter'
require_relative '../credentials'

class MakePosts
  def post_status(status)
    Twitter.configure do |config|
      credentials = Credentials.new
      config.consumer_key = credentials.consumer_key
      config.consumer_secret = credentials.consumer_secret
      config.oauth_token = credentials.oauth_token
      config.oauth_token_secret = credentials.oauth_token_secret
    end

    Twitter.update(status)
  end
end

