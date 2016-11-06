class MakersBnB < Sinatra::Base

  enable :sessions

  use Rack::MethodOverride
  register Sinatra::Flash
  register Sinatra::Partial

  set :session_secret, 'super secret'
  set :partial_template_engine, :erb
  
  enable :partial_underscores

  include Helpers

  get '/' do
    @spaces = Space.all
    erb :'spaces/spaces'
  end

  run! if app_file == $0
end
