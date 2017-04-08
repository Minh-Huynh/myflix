require 'spec_helper'

describe PasswordResetsController do
  describe "GET#show" do
    it "renders show template if the token is valid" do
      user = Fabricate(:user)
      user.update(reset_token: '12345')
      get :show, id: '12345'
      expect(response).to render_template :show
    end
    it "redirects to the expired token page if the token is not valid" do
      get :show, id: '12345'
      expect(response).to redirect_to expired_token_path
    end
  end

  describe "POST#create" do
    context "with valid token" do
      it "redirects to the sign in page" do
        alice = Fabricate(:user, password: 'old_password')
        alice.update_column(:reset_token, '12345')
        post :create, reset_token: '12345', password: 'new_password'
        expect(response).to redirect_to login_path
      end
      it "updates the user password" do
        alice = Fabricate(:user, password: 'old_password')
        alice.update_column(:reset_token, '12345')
        post :create, reset_token: '12345', password: 'new_password'
        expect(alice.reload.authenticate('new_password')).to be_true
      end
      it "sets the flash success message" do
        alice = Fabricate(:user, password: 'old_password')
        alice.update_column(:reset_token, '12345')
        post :create, reset_token: '12345', password: 'new_password'
        expect(flash[:success]).to be_present
      end
      it "regenerates the user token" do
        alice = Fabricate(:user, password: 'old_password')
        alice.update_column(:reset_token, '12345')
        post :create, reset_token: '12345', password: 'new_password'
        expect(alice.reload.reset_token).not_to eq('12345')
      end
    end
    context "with invalid token" do
      it "redirects to the expired token path" do
        post :create, reset_token: '12345', password: "some_password"
        expect(response).to redirect_to expired_token_path
      end
    end
  end
end