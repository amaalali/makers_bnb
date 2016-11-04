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
    @space = Space.first(id: session[:space_id])
    @request = Request.new(user_id: current_user, space_id: current_space, date: params[:date])

    if @request.save
      #success!
    else
      @request.errors.each {|e| puts e}
    end
    redirect to '/requests'
  end
end
