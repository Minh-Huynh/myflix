class AppMailer < ActionMailer::Base

  def notify_on_registration(user)
    @user = user
    mail from: 'info@myflix.com', to: user.email, subject: "You've created a new account"
  end

  def notify_on_password_reset(user)
    @user = user
    mail from: 'info@myflix.com', to: user.email, subject: "You've reset your password"
  end

  def send_forgot_password(user)
    @user = user
    mail to: user.email, from: "info@myflix.com", subject: "Please reset your password"
  end

  def send_invitation(invitation)
    @invitation = invitation
    mail to: invitation.email, from: "info@myflix.com", subject: "Check out this site!"
  end
end
