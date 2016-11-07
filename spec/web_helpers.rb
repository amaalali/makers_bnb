def sign_up(name:                  'Ben Forest',
            email:                 'ben@actors.co.uk',
            password:              'imasilvafox',
            password_confirmation: 'imasilvafox')
  visit('/users/new')
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end

def sign_in_user( email:    'ben@actors.co.uk',
                  password: 'imasilvafox')
  User.create email: email, password: password, password_confirmation: password, name: email
  visit('/session/new')
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign In'
end

def list_a_space(space_name:       'London Apartment',
                 description:      '1 Bedroom Apartment, overlooking The River Thames',
                 price_per_night:  '80.00',
                 available_from:   '01/12/2016',
                 available_to:     '01/01/2017')

  visit   '/spaces/new'
  fill_in 'space_name',       with: space_name
  fill_in 'description',      with: description
  fill_in 'price_per_night',  with: price_per_night
  fill_in 'available_from',   with: available_from
  fill_in 'available_to',     with: available_to
  click_button 'List my Space'
end
