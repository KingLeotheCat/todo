class UsersController < ApplicationController

#What routes do I need for login?
#The purpose of this route is to render login form
get '/login' do
  erb :login
end

#What routes for signup?

get '/signup' do

end

end