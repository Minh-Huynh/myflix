class UsersController < ApplicationController
  before_filter :authenticate_user, only: :show
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      AppMailer.notify_on_registration(@user).deliver
      redirect_to :home
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end

end