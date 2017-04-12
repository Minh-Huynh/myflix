= User.find_by(reset_token: params[:reset_token])
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
