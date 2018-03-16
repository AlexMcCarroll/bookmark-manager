require 'sinatra/base'
require './lib/list_of_links.rb'
require './lib/database_connection_setup.rb'
require 'rack'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :method_override, true
  register Sinatra::Flash

  get '/' do
    @links = Links.all
    erb(:index)
  end

  post '/links' do
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

  delete '/links' do
    Links.delete(params[:title_delete])
    # flash[:notice] = 'Your link has been deleted'
    redirect('/')
  end

  patch '/links' do
    Links.update(params[:id], params[:update_field].to_sym, params[:new_value])
    print params
    redirect('/')
  end

  run! if app_file == $PROGRAM_NAME
end
