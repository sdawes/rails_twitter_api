class User < ApplicationRecord
  def self.from_omniauth(auth_hash)
    #Look up the user or create them using keys in the auth hash
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      name: auth_hash.info.name,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
    )
    user
  end

  # token and secret is what came back from omniauth and this was saved to the user database. 

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
    config.consumer_key        = Rails.application.secrets.twitter_api_key
    config.consumer_secret     = Rails.application.secrets.twitter_api_secret
    config.access_token        = token
    config.access_token_secret = secret
end
  end

end
