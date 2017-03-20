class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    if !logged_in?
      flash[:danger] = "Log in before proceeding to page"
      redirect_to login_path
    end
  end

end
