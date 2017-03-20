shared_examples "requires sign in" do
  it "redirects to login page" do
    session[:current_user_id] = nil
    action
    expect(response).to redirect_to login_path 
  end
end
