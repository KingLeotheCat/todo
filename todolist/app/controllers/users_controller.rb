class UsersController < ApplicationController
  #What routes do I need for login?
  #The purpose of this route is to render login form
  get '/login' do
    erb :login
  end
  
  #receive login form, find user, log that user in
  post '/login' do
    #Find the user
    
    @user = User.find_by(email: params[:email])
    #Authenticate the user
    if @user.authenticate(params[:password])
      #log the user in
      session[:user_id] = @user.id
      #redirect to user's landing page
  
      redirect "users/#{@user.id}"
    else
   
      redirect '/login'
     #tell the user they entered invalid cred
     #redirect to login page
    end
  end
  
  #What routes for signup?
  #This route render's the signup form
  get '/signup' do
    erb :signup
  
  end
  
  post '/users' do
    #here is where we will create a new user and persist the new
    #user to the database 
    #I only want to persist a user that has a name, email, and password
    if params[:name] != "" && params[:email] != ""  && params[:password] != ""
      #valid input
      @user = User.create(params)
      session[:user_id] = @user.id
      #go to user's show page  
      redirect "users/#{@user.id}"
      
    else
      redirect '/login'
      
    
    end
  end
  
  #user SHOW routes
  
  get '/users/:id' do
    @user = User.find_by(id: params[:id])
     
    erb :'/users/show'
  end
  
  get '/logout' do
    session.clear
    redirect '/'
  end
end