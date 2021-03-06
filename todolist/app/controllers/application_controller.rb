 require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_to_do_list"
  end

  get "/" do
    
    if logged_in?
      redirect "/users/#{current_user.id}"
    
    else
      erb :welcome
    end
    
  end
  
  helpers do
    
    def logged_in?
      !!current_user
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def authorized_to_edit?(task)
      task.user == current_user
    end  
    
    def not_logged_in?
      if !current_user
        redirect '/'
      end  
    end

    def email
      params[:email]
    end
   
  end
end
