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
    puts session
    redirect "users/#{@user.id}"
  else
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
  
end

#user SHOW routes

get '/users/:id' do
  "This will be the user show route"
end
end