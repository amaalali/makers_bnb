class MakersBnB < Sinatra::Base

  register Sinatra::Flash

  get '/' do
    'Hello MakersBnB!'
  end

  run! if app_file == $0
end
