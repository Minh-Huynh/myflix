class Admin::VideosController < ApplicationController
  before_action :authenticate_admin
  def new
    @video = Video.new
  end

  def create
    video = Video.new(video_params)
    if video.save
      flash.notice = "You've created a new video"
      redirect_to  videos_path
    else
      render :new
    end
  end

  private
  def authenticate_admin
    unless logged_in? && current_user.admin 
      flash.notice = "You need to be an admin"
      redirect_to login_path 
    end
  end

  def video_params
    params.require(:video).permit!
  end

end
