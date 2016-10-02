class FollowersController < ApplicationController
  def index
  end

  def new
    @follower = Follower.new
  end

  def create
    @follower = Follower.new post_params

    if @follower.save
      redirect_to @follower, notice: "Your followers were successfully saved!"
    else
      render 'new', notice: "Sorry, for some reason the followers were unable to be saved"
    end
  end

  private

  def post_params
    params.require(:follower).permit(:twitter_followers)
  end

end
