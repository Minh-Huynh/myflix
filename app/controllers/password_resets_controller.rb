class PasswordResetsController < ApplicationController

  def show
    @user = User.find_by_reset_token(params[:id])
    redirect_to expired_token_path unless @user
  end

  def create
    user = User.find(params[:user_id])
    if user
      user.password = params[:password]
      user.generate_reset_token
      user.save
      flash[:success] = "Your password has been saved. Please sign in."
      redirect_to login_path
    else
      redirect_to expired_token_path
    end
  end

end
