class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def twitter_client
    @client ||= Twitter::REST::Client.new do |config|
     config.consumer_key        = Rails.application.secrets.twitter_api_key
     config.consumer_secret     = Rails.application.secrets.twitter_api_secret
     config.access_token        = current_user.token
     config.access_token_secret = current_user.secret
    end
  end

  # to enable the current_user variable to be used in the view file
  helper_method :current_user, :twitter_client


end
