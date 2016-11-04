class MakersBnB < Sinatra::Base

  get '/requests' do
    @bookings_requested = Request.all(:user_id => @current_user.id)
    erb :'requests/requests'
  end

  get '/requests/:id' do
    @space = Space.first(id: params[:id])
    erb :'requests/request'
  end

  post '/requests/:id' do
    @request = Request.create(date: params[:date], user_id: current_user, space_id: current_space)
    if @request.save
      #success!
    else
      @request.errors.each {|e| puts e}
    end
    redirect('/requests')
  end
end
