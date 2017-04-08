require 'spec_helper'

describe UsersController do

  describe "GET new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end
  describe "POST create" do
    it "creates a new user" do
      post :create, user: Fabricate.attributes_for(:user)
      expect(User.count).to eq(1)
    end
    it "redirects upon successful creation of user" do
      post :create, user: Fabricate.attributes_for(:user)
      expect(User.count).to redirect_to home_path 
    end
    it "redirects if password isn't provided" do
      post :create, user: {email: Faker::Internet.email, full_name: Faker::Name.name}
      expect(response).to render_template(:new)
    end
    it "redirects if username is not provided" do
      post :create, user: {email: Faker::Internet.email, password: "password"}
      expect(response).to  render_template(:new)
    end
    context "email sending" do
      it "sends out the email" do
        post :create, user: {email: Faker::Internet.email, password: "password"}
        ActionMailer::Base.deliveries.should_not be_empty
      end
      it "sends to the right receipient" do
        user_email = {full_name: Faker::Name.name, email: Faker::Internet.email, password: "password"}
        post :create, user: user_email 
        expect(ActionMailer::Base.deliveries.last.to.last).to eq(user_email[:email]) 
      end
    end
  end
  describe "GET show" do
    it "sets @user" do
      set_current_user
      user = Fabricate(:user)
      get :show, id: user.id
      expect(assigns(:user)).to eq(User.last)
    end
  end
end