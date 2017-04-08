class InvitationsController < ApplicationController
  before_filter :authenticate_user
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      flash.notice = "Invitation sent"
      AppMailer.send_invitation(@invitation).deliver
      redirect_to new_invitation_path
    else
      render_template :new
    end
  end

  def invitation_params
    params.require(:invitation).permit!
  end
end
