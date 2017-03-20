class FollowsController < ApplicationController
  def index
  end

  def create
    followee = User.find(params[:id])
    current_user.followees << followee if current_user.id != followee.id
    redirect_to follows_path
  end

  def destroy
    followee_id = params[:id]
    current_user.followees.delete(User.find(followee_id))
    redirect_to follows_path
  end
end