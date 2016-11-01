class MakersBnB < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  use Rack::MethodOverride
  register Sinatra::Flash

  get '/' do
    erb :'spaces/listings'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
