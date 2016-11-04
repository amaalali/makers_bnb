class MakersBnB < Sinatra::Base

  get '/requests' do
    @bookings_requested = Request.all(:user_id => current_user.id)
    erb :'requests/requests'
  end

  get '/requests/:id' do
    @space = Space.first(id: params[:id])
    erb :'requests/request'
  end

  post '/requests/:id' do
    puts current_user.id
    puts params[:space_id]
    puts params[:date]
    @request = Request.new(user_id: current_user.id, space_id: params[:space_id], date: params[:date], status: "not confirmed")

    if @request.save
      #success!
    else
      @request.errors.each {|e| puts e}
    end
    redirect '/'
  end
end
