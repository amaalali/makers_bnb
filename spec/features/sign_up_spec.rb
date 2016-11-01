require 'spec_helper'

feature 'User Sign Up' do

  scenario 'a new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'user provides mismatching passwords' do
    sign_up(password_confirmation: 'wrong')
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
