feature 'Request spaces' do
  before(:each) do
    User.create(email: 'ben@actors.co.uk', password: 'imasilvafox', password_confirmation: 'imasilvafox', name: 'Ben')
  end
  scenario 'from the space link' do
    sign_in_user
    visit '/spaces/new'
    fill_in 'space_name',       with: 'house'
    fill_in 'description',      with: 'big'
    fill_in 'price_per_night',  with: 5
    fill_in 'available_from',   with: '01/12/2016'
    fill_in 'available_to',     with: '2017-01-01'
    click_button 'List my Space'
    expect(current_path).to eq('/spaces')
    click_link 'house'
    fill_in :date, with: "01/01/2017"
    click_button "Request to Book"
    expect(current_path).to eq('/bookings')
    expect(page).to have_content('2017-01-01')
    #expect(page).to have_content('not confirmed')
  end
end
