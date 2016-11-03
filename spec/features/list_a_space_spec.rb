require 'spec_helper'

feature 'List a Space' do

  scenario 'create a new space' do
    sign_in_user
    list_a_space
    expect(current_path).to eq('/spaces')
    within 'ul#spaces' do
      expect(page).to have_content('London Apartment')
      expect(page).to have_content('1 Bedroom Apartment, overlooking The River Thames')
      expect(page).to have_content('80.00')
    end
  end
end
