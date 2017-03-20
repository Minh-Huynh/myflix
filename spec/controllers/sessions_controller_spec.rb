require 'spec_helper'

describe SessionsController do
  describe "POST create" do
    it "logs in a user, given username and password" do
      user = Fabricate(:user)
      post :create, email: user.email, password: user.password
      expect(response).to redirect_to videos_path
    end
    it "does not create a session if password is wrong" do
      user = Fabricate(:user)
      post :create, email: user.email, password: Faker::Lorem.word 
      expect(session[:current_user_id]).to be_nil
    end
    it "redirects user to login page if password is wrong" do
      user = Fabricate(:user)
      post :create, email: user.email, password: Faker::Lorem.word 
      expect(response).to redirect_to login_path  
    end
    it "redirects user to login page if username doesn't exist" do
      user = Fabricate(:user)
      post :create, email: Faker::Lorem.word, password: user.password
      expect(response).to redirect_to login_path
    end
  end

  describe "GET destroy" do
    it "redirects a user to login path once session is destroyed" do
      session[:current_user_id] = Fabricate(:user).id
      get :destroy
      expect(response).to redirect_to login_path
    end
    it "clears the session" do
      session[:current_user_id] = Fabricate(:user).id
      get :destroy
      expect(session[:current_user_session]).to be_nil
    end
  end
end