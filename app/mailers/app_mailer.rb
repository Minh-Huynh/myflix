class AppMailer < ActionMailer::Base

  def notify_on_registration(user)
    @user = user
    mail from: 'info@myflix.com', to: user.email, subject: "You've created a new account"
  end
end