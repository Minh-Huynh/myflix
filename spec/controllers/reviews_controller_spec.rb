require 'spec_helper'

describe ReviewsController do 
  context "POST create" do
    let(:user) {Fabricate(:user)}
    let(:video) {Fabricate(:video)}
    let(:review) {Fabricate.build(:review, user: user, video: video)}
    before do
      request.env['HTTP_REFERER'] = 'http://test.host/videos/' + video.id.to_s
    end
    it "creates a new review" do
      post :create, review: review.attributes, video_id: video.id
      expect(Review.count).to eq(1)
    end
    it "redirects back to video page if review successfully created" do
      post :create, review: review.attributes, video_id: video.id
      expect(response).to redirect_to video_path(video.id)
    end
    it "re-renders new page if score is not included" do
      faulty_review = Fabricate.build(:review, user: user, video: video, score: nil)
      post :create, review: faulty_review.attributes, video_id: video.id
      expect(response).to render_template("videos/show")
    end
  end
end