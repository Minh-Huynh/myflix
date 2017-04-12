require 'spec_helper'

feature "signing in" do
  background do
    @user = Fabricate(:user, full_name: "Igor", email: "john@test.com", password: "test")
    @video = Fabricate(:video)

  end

  scenario "signing in with existing user" do
    log_in_with @user.email, @user.password 
    expect(page).to have_content("Welcome, Igor")
    expect(current_path).to eq("/videos")
  end

  scenario "add video to queue" do
    log_in_with @user.email, @user.password
    expect(page).to have_video_image(@video.id)

    click_link("video_#{@video.id}_link")
    expect_to_be_on_video_page(page, @video)

    click_button("+ My Queue")
    expect_to_be_on_my_queue(@video)
    
    click_link("video_#{@video.id}_title")
    expect(page).to have_content("#{@video.description}")
    expect(page).to have_no_content("+ My Queue")

    @video_two = Fabricate(:video)
    @video_three = Fabricate(:video)
    return_to_video_index
    expect(page).to have_selector('img', count: 3)

    add_video_to_queue_from_video_index(@video_two.id)
    add_video_to_queue_from_video_index(@video_three.id)
    click_link("My Queue")
    expect(page).to have_selector('tr', count: 4)

    fill_in("queue_item_#{@user.queue_items.first.id}_rank", with: "3")
    fill_in("queue_item_#{@user.queue_items.second.id}_rank", with: "2")
    fill_in("queue_item_#{@user.queue_items.third.id}_rank", with: "1")
    click_button('Update Instant Queue')
    expect(page).to have_selector("table tr:nth-child(1)", text: @user.queue_items.first.video.title)
    expect(page).to have_selector("table tr:nth-child(2)", text: @user.queue_items.second.video.title)
    expect(page).to have_selector("table tr:nth-child(3)", text: @user.queue_items.third.video.title)
  end
end

  def add_video_to_queue_from_video_index(video_id)
    click_link("video_#{video_id}_link")
    click_button("+ My Queue")
    return_to_video_index
  end

  def return_to_video_index
    click_link("MyFLiX")
  end

  def have_video_image(video_id)
    have_css("img#video_#{video_id}")
  end

  def expect_to_be_on_video_page(page, video)
    expect(page).to have_content("Rating")
    expect(current_path).to eq("/videos/#{video.id}")
  end

  def expect_to_be_on_my_queue(new_video)
    expect(current_path).to eq("/my_queue")
    expect(page).to have_content("#{new_video.title}")
  end


