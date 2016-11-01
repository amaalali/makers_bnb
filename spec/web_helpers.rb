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
  visit('/session/new')
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign In'
end
