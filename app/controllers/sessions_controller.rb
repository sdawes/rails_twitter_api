class SessionsController < ApplicationController
  def create
    # complete omniauth authentication and crate user record in database
    # raise env["omniauth.auth"].to_yaml

    @user = User.from_omniauth(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are signed out"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
