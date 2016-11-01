class MakersBnB < Sinatra::Base

  get '/session/new' do
    erb :'sessions/new'
  end

  post '/session/new' do
    @user = User.authenticate(params[:email], params[:password])
     if @user
       session[:user_id] = @user.id
       redirect to('/')
     else
       flash.now[:errors] = ['The email or password is incorrect']
       erb :'sessions/new'
     end
  end
end
