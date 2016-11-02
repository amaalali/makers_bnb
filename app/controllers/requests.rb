class MakersBnB < Sinatra::Base

  get '/requests' do
    @bookings_requested = Request.all(:user_id => @current_user.id)
    erb :'requests/requests'
  end

end
