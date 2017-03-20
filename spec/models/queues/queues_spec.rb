require 'spec_helper'

describe QueueItem do
  it {should belong_to(:user)}
  it {should belong_to(:video)}

  describe "#video_title" do
    it "returns the title of the associated video" do
      video = Fabricate(:video, title: "Monk")
      user = Fabricate(:user)
      queue_item = Fabricate(:queue_item, video: video, user: user)
      expect(queue_item.video_title).to eq("Monk")
    end
  end
  describe "#score" do
    it "returns the score of the video given by the associated user" do
      video = Fabricate(:video)
      user = Fabricate(:user)
      review = Fabricate(:review, user: user, video: video, score: 4)
      queue_item = Fabricate(:queue_item, user: user, video: video)
      expect(queue_item.score).to eq(4)
    end
  end
  describe "#category_name" do 
    it "returns the category belonging to video" do
      category = Fabricate(:category, title: "comedies")
      video = Fabricate(:video, category: category)
      user = Fabricate(:user)
      queue_item = Fabricate(:queue_item, video: video, user: user)
      expect(queue_item.category_name).to eq("comedies")
    end
  end
  describe "#category" do
    it "returns the category of the video" do
      category = Fabricate(:category, title: "comedies")
      video = Fabricate(:video, category: category)
      user = Fabricate(:user)
      queue_item = Fabricate(:queue_item, video: video, user: user)
      expect(queue_item.category).to eq(category)
    end
  end
end