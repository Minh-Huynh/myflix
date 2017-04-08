class RegistrationsController < ApplicationController
  def show
    invitation = Invitation.find_by(invite_token: params[:id])
    if invitation
      @user = User.new(email: invitation.email)
    else
      flash.notice = "This invitation was already used"
      redirect_to login_path
    end
  end
end
