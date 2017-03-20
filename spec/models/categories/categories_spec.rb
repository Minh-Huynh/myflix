require 'spec_helper'

describe Category do
  it {should have_many(:videos)}
  describe "#recent_videos " do
    it "returns videos in descending date order" do
      category = Category.create(title: "Test Category")
      Video.create(title: "1st Movie", description: "this is the first one", category: category)
      Video.create(title: "2nd Movie", description: "this is the second one", category: category)
      Video.create(title: "3rd Movie", description: "this is the third one", category: category)
      Video.create(title: "4th Movie", description: "this is the fourth one", category: category)
      Video.create(title: "5th Movie", description: "this is the fifth one", category: category)
      Video.create(title: "6th Movie", description: "this is the sixth one", category: category)
      Video.create(title: "7th Movie", description: "this is the seventh one", category: category)
      Video.create(title: "8th Movie", description: "this is the eigth one", category: category)
      recent_videos = category.recent_videos
      expect(recent_videos.length).to eq(6)
      expect(recent_videos.first.created_at).to be  > recent_videos.last.created_at
    end
    it "returns all videos if there are less than six videos" do
      category = Category.create(title: "Test Category")
      Video.create(title: "1st Movie", description: "this is the first one", category: category)
      Video.create(title: "2nd Movie", description: "this is the second one", category: category)
      Video.create(title: "3rd Movie", description: "this is the third one", category: category)
      Video.create(title: "4th Movie", description: "this is the fourth one", category: category)
      Video.create(title: "5th Movie", description: "this is the fifth one", category: category)
      recent_videos = category.recent_videos
      expect(recent_videos.length).to eq(5)
      expect(recent_videos.first.created_at).to be  > recent_videos.last.created_at
    end
  end
end