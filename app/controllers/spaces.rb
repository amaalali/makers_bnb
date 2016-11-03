class MakersBnB < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    @spaces = Space.create(space_name: params[:space_name],
                      description: params[:description],
                      price_per_night: params[:price_per_night],
                      available_from: params[:available_from],
                      available_to: params[:available_to])
    redirect('/spaces')
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/spaces'
  end

  post '/spaces' do
    @unfiltered_spaces = Space.all
    @spaces = []
    @unfiltered_spaces.each do |space|
      if (space.available_from <= Date.parse(params[:available_on]) && Date.parse(params[:available_on]) <= space.available_to)
        @spaces << space
      end
    end
    erb :'spaces/spaces'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    erb :'spaces/space'
  end

end

Space.all.each {|space| puts Date.parse('2017-01-01') < space.available_to}
