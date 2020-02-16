require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_to_do_list"
  end

  get "/" do
    erb :welcome
  end
  
  
  
end
