require 'spec_helper'

describe Category do
  it "creates a new category" do 
    category = Category.create(title: "Action Movies")
    expect(Category.first.title).to eq("Action Movies")
  end
end