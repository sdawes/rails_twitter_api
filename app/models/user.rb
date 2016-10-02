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



end
