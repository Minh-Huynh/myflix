require 'spec_helper'

feature "follow and unfollow someone" do
  background do
    @user = Fabricate(:user)
    @followee = Fabricate(:user)
    @video = Fabricate(:video)
    @video.reviews.create(user: @followee, score: 4, comment: "great crap")
  end

  scenario do
    log_in_with @user.email, @user.password
    click_link("video_#{@video.id}_link")
    click_link("#{@followee.full_name}")
    expect(page).to have_selector(:link_or_button, "Follow")

    click_button("Follow")
    expect(page).to have_content("#{@followee.full_name}")

    find(:xpath, "//a[@href='/follows/#{@followee.id}']").click
    expect(page).to have_no_content("#{@followee.full_name}")
  end
end


