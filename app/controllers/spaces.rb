class MakersBnB < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    #@spaces = Space.new(params)
    @space = Space.new(params.merge(user: current_user))
    if @space.save
      #success!
    else
      @space.errors.each {|e| puts e}
    end

    redirect('/spaces')
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/spaces'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    erb :'spaces/space'
  end

end
