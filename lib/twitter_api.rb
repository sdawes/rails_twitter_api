class TwitterApi
  def initialize(user)
    @user = user
  end

  def our_public_tweets
    client.user_timeline(user, count: 1, exclude_replies: true, include_rts: false)
  end

  def followers
    client.followers.take(20)
  end

  private

  attr_reader :user

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_api_key
      config.consumer_secret = Rails.application.secrets.twitter_api_secret
      config.access_token = user.token
      config.access_token_secret = user.secret
    end
  end
end
