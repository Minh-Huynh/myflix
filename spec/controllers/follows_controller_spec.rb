require 'spec_helper'

describe FollowsController do
  context "follows#create" do
    it "should create a new follow" do
      set_current_user
      user = Fabricate(:user) 
      post :create, id: user.id, follow: user.attributes
      expect(Follow.count).to eq(1)
    end
  end
  context "follows#destroy" do
    it "should destroy an existing follow" do
      set_current_user
      followee = Fabricate(:user)
      current_user = User.find(session[:current_user_id])
      current_user.followees << followee 
      delete :destroy, id: followee.id 
      expect(Follow.count).to eq(0)
    end
  end
end