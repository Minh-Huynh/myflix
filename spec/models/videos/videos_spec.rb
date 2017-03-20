require 'spec_helper'

describe Video do
  it {should belong_to(:category)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  describe "search_by_title" do
    it "should return an empty array if no results" do
      Video.create(title: "family guy", description: "a funny sitcom")
      expect(Video.search_by_title("due")).to eq([])
    end
    it "should return an array with a single Video if one result" do
      Video.create(title: "family guy", description: "a funny sitcom")
      expect(Video.search_by_title("family").length).to eq(1)
    end
    it "should return an array with multiple Videos if multiple results" do
      Video.create(title: "family guy", description: "a funny sitcom")
      Video.create(title: "action guy", description: "an action sitcom")
      expect(Video.search_by_title("guy").length).to eq(2)
    end
    it "should return an array with one video for partial match" do
      Video.create(title: "family guy", description: "a funny sitcom")
      expect(Video.search_by_title("gu").length).to eq(1)
    end
  end
  describe "average_review_score" do
    it "should return an average score of all a video's reviews" do
      video = Fabricate(:video) do
        reviews {Fabricate.times(4,:review)}
      end
      expect(video.average_review_score).to eq(video.reviews.average(:score))
    end
    it "should return a zero if there are not reviews" do
      video = Fabricate(:video)
      expect(video.average_review_score).to eq(nil)
    end
  end
end