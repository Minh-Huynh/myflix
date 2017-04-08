require 'spec_helper'

describe InvitationsController do
  describe "GET new" do
    it "sets @invitation to a new invitation" do
      set_current_user
      get :new
      expect(assigns(:invitation)).to  be_new_record
      expect(assigns(:invitation)).to  be_instance_of Invitation
    end
    it_behaves_like "requires sign in" do
      let(:action) {get :new}
    end
  end

  describe "POST create" do
    context "with valid input" do
      it "redirects to the invitation new page" do
        set_current_user
        post :create, invitation:{name: "John Smith", email: "joe@example.com", message: "Hey join this stuff"}
        expect(response).to redirect_to new_invitation_path
      end
      it "creates an invitation" do
        set_current_user
        post :create, invitation:{name: "John Smith", email: "joe@example.com", message: "Hey join this stuff"}
        expect(Invitation.count).to eq(1)
      end
      it "sends an email to the receipient" do
        set_current_user
        post :create, invitation:{name: "John Smith", email: "joe@example.com", message: "Hey join this stuff"}
        expect(ActionMailer::Base.deliveries.last.to).to eq(["joe@example.com"])
      end
      it "sets the flash success message" do
        set_current_user
        post :create, invitation:{name: "John Smith", email: "joe@example.com", message: "Hey join this stuff"}
        expect(flash.count).to eq(1)
      end
    end
    context "with invalid input"
  end
end
