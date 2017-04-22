require 'spec_helper'

describe Admin::VideosController do
  describe "GET new" do
    it "sets @video to video" do
      user = Fabricate(:user, admin: true)
      set_current_user(user)
      get :new
      expect(assigns(:video)).to be_a_kind_of(Video)
    end
    it "redirects the regular user to login page" do
      user = Fabricate(:user, admin: false)
      set_current_user(user)
      get :new
      expect(response).to redirect_to(login_path)
    end
    it "sets the flash message for regular user" do
      user = Fabricate(:user, admin: false)
      set_current_user(user)
      get :new
      expect(flash.count).to eq(1)
    end
  end
  describe "POST create" do
    it "saves the video if valid" do
      user = Fabricate(:user, admin: true)
      set_current_user(user)
      video = Fabricate.build(:video)
      post :create, video: video.attributes
      expect(Video.all.count).to eq(1)
    end
    it "does not save the video if invalid" do
      user = Fabricate(:user, admin: true)
      set_current_user(user)
      video = Fabricate.build(:video, title: "", description: "")
      post :create, video: video.attributes
      expect(Video.all.count).to eq(0)
    end
  end
end
