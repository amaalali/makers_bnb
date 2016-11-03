require 'spec_helper'

feature 'Filter spaces' do
  before(:each) do
    Space.create(space: "One", description: "Place One", price_per_night: "1234.00", available_from: "01/01/2017", available_to: "31/12/2017")
    Space.create(space: "Two", description: "Place Two", price_per_night: "123.00", available_from: "01/01/2017", available_to: "31/12/2018")
  end

  scenario 'based on dates' do
    visit '/'
    fill_in :available_from, with:"01/01/2018"
    click_button "Filter Spaces"
    expect(page).to have_content('Two')
    expect(page).to have_content('Place Two')
    expect(page).to have_content('123.00')
  end
end
