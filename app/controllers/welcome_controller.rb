class WelcomeController < ApplicationController

  require 'twitter_api'
  
  def index
    @twitter_api = TwitterApi.new(current_user)
  end
end
