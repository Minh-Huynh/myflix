require 'spec_helper'

describe VideosController do
  describe "GET show" do
    it 'assigns video for authenticated users' do
      session[:current_user_id] = Fabricate(:user).id
      video = Fabricate(:video)
      get :show, id: video.id
      expect(assigns(:video)).to eq(video)
    end
    it 'redirects the user to the sign in page for unauthenticated users' do
      video = Fabricate(:video)
      get :show, id: video.id
      expect(response).to redirect_to login_path
    end
  end

  describe "POST search" do
    it "sets @results for authenticated users" do
      session[:current_user_id] = Fabricate(:user).id
      futurama = Fabricate(:video, title: 'Futurama')
      post :search, query: 'rama'
      expect(assigns(:results)).to eq([futurama])
    end
    it "redirects to sign in page for unauthenticated users" do
      futurama = Fabricate(:video, title: 'Futurama')
      post :search, query: 'rama'
      expect(response).to redirect_to login_path
    end
  end
end