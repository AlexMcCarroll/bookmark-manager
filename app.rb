require 'sinatra/base'
require './lib/list_of_links.rb'
require './lib/database_connection_setup.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Links.all
    erb(:index)
  end

  post '/new_link' do
    @valid = Links.valid_url?(params[:url])
    if @valid
      Links.create(params[:url])
      flash[:notice] = 'Your link has been added!'
      redirect('/')
    else
      flash[:notice] = 'Not valid!'
      redirect('/')
    end
  end

  run! if app_file == $PROGRAM_NAME
end
