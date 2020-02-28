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
  
  


  #show route for a task 
  get '/tasks/:id' do
    @task = Task.find(params[:id])
    erb :'/tasks/show'
  end
  
  
  
  
  get '/tasks/:id/edit' do
    @task = Task.find(params[:id])
    if logged_in?
      if @task.user == current_user
        erb :'tasks/edit'
      else
        redirect "users/#{current_user.id}"
       end   
    else
      redirect '/'
    end 
  end  
     


  patch '/tasks/:id' do
    #find task
    @task = Task.find(params[:id])
    if logged_in?
      if @task.user==current_user
        #modify the task
        @task.update(content: params[:content])
        #redirect to show page
       redirect "/tasks/#{@task.id}"
      else
    
      redirect "/tasks/#{current_user.id}"
    
      end
    else
      redirect '/'
    end
  end
  
  #---------------------------
  
  #helper method:
  
  #private
  
    # def set_task
    
    #   @task = Task.find(params[:id])   <- for cleaner code
    # end
  
  #----------------------------
  
  
  
#index route for all tasks


end