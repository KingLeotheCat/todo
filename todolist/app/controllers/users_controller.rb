class UsersController < ApplicationController

#What routes do I need for login?
#The purpose of this route is to render login form
get '/login' do
  erb :login
end

#receive login form, find user, log that user in
post '/login' do
  @user = User.find_by(email: params[:email])
  
  if @user.authenticate(params[:password])
end
#What routes for signup?

get '/signup' do

end

end