require 'spec_helper'

feature 'List a Space' do

  scenario 'Cannot click button "List a Space" if user is not logged in' do
    visit '/'
    expect(page).not_to have_content('List a Space')
  end

  scenario 'redirects to "Sign In" if user is not logged in' do
    visit '/space/new'
    expect(page).not_to have_content('List a Space')
    expect(page).not_to have_content('Sign In')
    # expect(page.current_path).to eq('/session/new')
  end

  scenario 'create a new space' do
    sign_in_user
    list_a_space
    expect(current_path).to eq('/spaces')
    within 'div.space' do
      expect(page).to have_content('London Apartment')
      expect(page).to have_content('1 Bedroom Apartment, overlooking The River Thames')
      expect(page).to have_content('80.00')
    end
  end
end
