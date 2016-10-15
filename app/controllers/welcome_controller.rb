class WelcomeController < ApplicationController
  def index
    @twitter_api = TwitterApi.new(current_user)
  end
end
