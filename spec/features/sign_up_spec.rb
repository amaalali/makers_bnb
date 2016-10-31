require 'spec_helper'

feature 'User Sign Up' do

  scenario 'a new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
  end

end
