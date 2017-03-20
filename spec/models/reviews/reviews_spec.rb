require 'spec_helper'

describe Review do
  it {should belong_to(:video)}
  it {should belong_to(:user)}
  it {should validate_presence_of(:score)}
  it "should order reviews from newest to oldest" do
    test_reviews = Fabricate.times(4, :review)
    reviews = Review.reorder(created_at: :asc)
    expect(test_reviews).to eq(reviews)
  end
end