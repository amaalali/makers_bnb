feature 'Request spaces' do
  before(:each) do
    User.create(email: 'ben@actors.co.uk', password: 'imasilvafox', password_confirmation: 'imasilvafox', name: 'Ben')
    Space.create(space_name: "One", description: "Place One", price_per_night: "1234.00", available_from: "01/01/2017", available_to: "31/12/2017", user: User.first)
  end
  scenario 'from the space link' do
    sign_in_user
    visit '/'
    click_link 'One'
    expect(current_path).to eq('/requests/4')
    fill_in :date, with: "01/01/2017"
    click_button "Request to Book"
    expect(current_path).to eq('/single_request')
    expect(page).to have_content("One")
    expect(page).to have_content("not confirmed")
    expect(page).to have_content("01/01/2017")
  end
end
