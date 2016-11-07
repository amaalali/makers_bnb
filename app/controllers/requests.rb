class MakersBnB < Sinatra::Base

  get '/requests' do
    @bookings_requested = Request.all(:user_id => @current_user.id)
    erb :'requests/requests'
  end

  get '/requests/:id' do
    @space = Space.first(id: params[:id])
  erb :'requests/request'
  end

  post '/requests' do
      #@space = Space.first(id: session[:space_id])
      @request = Request.new(user_id: current_user.id,
                    date: params[:date])
                    erb :'requests/single_request'
      if @request.save
        session[:request_id] = @request.id
        redirect 'requests/requests'
      else
        flash.now[:errors] = @user.errors.full_messages
        erb :'/'
      end
    end


end
