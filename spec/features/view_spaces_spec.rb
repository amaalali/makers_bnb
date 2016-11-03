require 'spec_helper'

feature 'View spaces' do
  scenario 'view a new space' do
    User.create email: 'me@me.com', password: '1', password_confirmation: '1', name: 'James'
    Space.create space_name: 'London Apartment',
      description: '1 Bedroom Apartment, overlooking The River Thames',
      price_per_night:  '80.00',
      available_from:   '01/01/2016',
      available_to:     '01/01/2017',
      user: User.first
    visit '/spaces'
    click_on 'London Apartment'
    expect(page).to have_content('London Apartment')
    expect(page).to have_content('1 Bedroom Apartment, overlooking The River Thames')
    expect(page).to have_content('80.00')
  end
end
