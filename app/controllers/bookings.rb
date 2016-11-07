class MakersBnB < Sinatra::Base

  get '/bookings' do
    @bookings_requested = Booking.all(:user_id => @current_user.id)
    erb :'requests/requests'
  end

  get '/bookings/:id' do
    @space = Space.first(id: params[:id])
  erb :'bookings/booking'
  end

  post '/bookings' do
      # @user = User.first(id: session[:user_id])
      @space = Space.first(id: session[:space_id])
      @booking = Booking.new(user_id: current_user.id, space_id: @space.id,
                date: params[:date], status: params[:status])
      if @booking.save
        session[:booking_id] = @booking.id
        erb :'bookings/single_booking'
      else
        flash.now[:errors] = @booking.errors.full_messages
        erb :'/'
      end
    end


end
