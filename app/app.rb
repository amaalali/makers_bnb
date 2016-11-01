ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'

require_relative 'data_mapper_setup'

require_relative 'controllers/users'

class MakersBnB < Sinatra::Base

  get '/' do
    'Hello MakersBnB!'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
  end

  run! if app_file == $0
end
