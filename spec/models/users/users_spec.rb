require 'spec_helper'

describe User do
  it "should be able to have many followees through follows" do
    user = Fabricate(:user)
    user.followees << Fabricate(:user)
    user.followees << Fabricate(:user)
    expect(user.followees.count).to eq(2)
  end
  it "should not allow the duplicate follows" do
    user = Fabricate(:user)
    followee = Fabricate(:user)
    user.followees << followee
    user.followees << followee
    expect(user.followees.count).to eq(1)
  end
end