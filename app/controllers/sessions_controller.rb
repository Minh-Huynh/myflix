class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to videos_path
    else
      flash[:danger] = "There is something wrong with your username/password"
      redirect_to login_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to login_path, notice: "Your are signed out"
  end

end