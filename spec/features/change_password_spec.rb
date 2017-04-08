require 'spec_helper'

feature 'change password' do
  background do
    @user = Fabricate(:user)
  end

  scenario do
    visit(login_path)
    click_link('Forgot your password?')
    fill_in('Email', with: @user.email)
    click_button('Send Email')
    expect(ActionMailer::Base.deliveries.last.to.first).to eq(@user.email)

    open_email(@user.email)
    current_email.click_link('Reset My Password')
    expect(page).to have_content 'Reset Your Password'

    fill_in(:password , with: 'new_password')
    click_button('Reset Password')
    expect(page).to have_content 'Your password has been saved. Please sign in.'

    fill_in('Email', with: @user.email)
    fill_in('Password', with: 'new_password')
    click_button('Log In')
    expect(page).to have_content "Welcome, #{@user.full_name}"
  end
end