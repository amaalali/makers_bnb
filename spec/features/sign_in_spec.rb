require 'spec_helper'

feature "Signing In" do
  scenario "User should be able to sign in and a welcome message be displayed" do
    sign_up
    sign_in_user
    expect(page).to have_content 'Welcome, Ben Forest'
  end
end
