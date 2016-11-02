require 'spec_helper'

feature 'List a Space' do

  scenario 'create a new space' do
    visit('/spaces/new')
    fill_in 'space_name',       with: 'London Apartment'
    fill_in 'description',      with: '1 Bedroom Apartment, overlooking The River Thames'
    fill_in 'price_per_night',  with: '80.00'
    fill_in 'available_from',   with: '01/01/2016'
    fill_in 'available_to',     with: '01/01/2017'
    click_button 'List my Space'

    visit '/spaces'
    expect(current_path).to eq('/spaces')

    within 'ul#spaces' do
      expect(page).to have_content('London Apartment')
    end
  end
end
