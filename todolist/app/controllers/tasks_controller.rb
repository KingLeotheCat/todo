class TasksController < ApplicationController
  
  #get tasks/new to render a form to create new task
  get '/tasks/new' do
    erb :'/tasks/new'
  end
  
  #Create a new entry
  post '/tasks' do
    
    #I want to create a new task and save it to DB
    #I only want to save the entry if it has some content
    if !logged_in?
      redirect '/'
    end
    
    if params[:content] !=""
      #Create a new entry
      @task = Task.create(content: params[:content], user_id: current_user.id)
      redirect "/tasks/#{@task.id}"
    else
      redirect '/tasks/new'
    end
    #I also only want to create a task if a user is logged in
    
  end
  
  


#get tasks/new to render form to create new task

#show route for a task entry

#index route for all tasks

end