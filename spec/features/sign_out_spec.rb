require 'spec_helper'

feature 'User signs out' do
  before(:each) do
    User.create(name: 'test',
                email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test')
  end

  scenario 'while being signed in' do
    sign_in_user(email: 'test@test.com', password: 'test')
    click_button 'Sign Out'
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end
