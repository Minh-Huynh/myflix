require 'spec_helper'

describe QueueItemsController do
  describe "GET index" do
    it "sets @queue_items to the queue items of the logged in user" do
      alice = Fabricate(:user)
      video = Fabricate(:video)
      session[:current_user_id] = alice.id
      queue_item1 = Fabricate(:queue_item, user: alice, video: video)
      queue_item2 = Fabricate(:queue_item, user: alice, video: video)
      get :index
      expect(assigns(:queue_items)).to match_array([queue_item1, queue_item2])
    end
  it_behaves_like "requires sign in" do
    let(:action) { get :index}
  end
  end
  describe "POST update" do
    let(:user){Fabricate(:user)}
    let(:video1){Fabricate(:video)}
    let(:video2){Fabricate(:video)}
    let(:queue_item1){Fabricate(:queue_item, user: user, video: video1, rank: 1)}
    let(:queue_item2){Fabricate(:queue_item, user: user, video: video2, rank: 2)}
    it "updates ranks of queue items" do
      set_current_user
      post :update, queue_items: {queue_item1.id.to_s =>
                                {'rank' => 2, 'score' => queue_item1.rank},
                                queue_item2.id.to_s =>
                                {'rank' => 1, 'score' => queue_item2.rank}}
      expect([queue_item1.reload.rank, queue_item2.reload.rank]).to eq([2 ,1])
    end
    it "updates scores of queue items" do
      set_current_user
      post :update, queue_items: {queue_item1.id.to_s =>
                                {'rank' => queue_item1.rank, 'score' => 3},
                                queue_item2.id.to_s =>
                                {'rank' => queue_item2.rank, 'score' => 4}}
      expect([queue_item1.reload.score, queue_item2.reload.score]).to eq([3 ,4])
    end
  end
  describe "POST create" do
    let(:user){Fabricate(:user)}
    let(:video1){Fabricate(:video)}
    let(:queue_item1){Fabricate.build(:queue_item, user: user, video: video1, rank: 1)}
    it "creates a new queue item" do
      set_current_user
      post :create, queue_item: queue_item1.attributes 
      expect(QueueItem.all.count).to eq(1)
    end
  end
  describe "DELETE destroy" do
    it "deletes the queue item" do
      user = Fabricate(:user)
      set_current_user
      video = Fabricate(:video)
      queue_item = Fabricate(:queue_item, user: user, video: video)
      post :destroy, id: queue_item.id
      expect(QueueItem.all.count).to eq(0)
    end
  end
end