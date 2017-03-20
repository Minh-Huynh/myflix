module Features
  module SessionHelpers
    def log_in_with(email, password)
      visit login_path
      fill_in "email", with: email
      fill_in "password", with: password
      click_button "Log In"
    end
  end
end