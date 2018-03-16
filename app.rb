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
      Links.create(url: params[:url], title: params[:title])
      flash[:notice] = 'Your link has been added'
      redirect('/')
    else
      flash[:notice] = 'Not valid!'
      redirect('/')
    end
  end

  post '/delete_link' do
    Links.delete(params[:title_delete])
    # flash[:notice] = 'Your link has been deleted'
    redirect('/')
  end

  post '/update_link' do
    Links.update(params[:id], params[:update_field], params[:new_value])
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
