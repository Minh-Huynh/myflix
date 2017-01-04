require 'spec_helper'

describe Video do
  it "saves a new video" do 
    video = Video.create(title: "test movie", description: "a movie that is not real")
    video.title.should == "test movie"
  end

  it "creates a video with a category" do
    category = Category.create(title: "Action Movies")
    video = Video.create(title: "Top Gun 5", category_id: category.id)
    expect(video.category.title).to eq("Action Movies")
  end

  it "requires the title" do
    video = Video.create(description: "default description")
    expect(video.errors.full_messages[0]).to eq("Title can't be blank")
  end

  it "requires the description" do
    video = Video.create(title: "this is a test")
    expect(video.errors.full_messages[0]).to eq("Description can't be blank")
  end
end