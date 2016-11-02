class MakersBnB < Sinatra::Base

  get '/requests' do
    @bookings_requested = Requested.all(filter)
    @bookings_received = Received.all(filter)
    erb :'requests/requests'
  end

end
