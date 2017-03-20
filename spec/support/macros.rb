def set_current_user(user=nil)
  session[:current_user_id] = (user || Fabricate(:user)).id
end