class TasksController < ApplicationController
  
  
  get '/tasks' do
    not_logged_in?
    @tasks = Task.all
    erb :'tasks/index'
  end
  
  #get tasks/new to render a form to create new task
  get '/tasks/new' do
    not_logged_in?
    erb :'/tasks/new'
  end
  
  
  
  #Create a new entry
  post '/tasks' do
    
    #I want to create a new task and save it to DB
    #I only want to save the entry if it has some content
    
      # redirect '/'
    # end
    
    if params[:content] !=""
      #Create a new entry
      @task = Task.create(content: params[:content], user_id: current_user.id)
      redirect "/tasks/#{@task.id}"
    else
      redirect '/tasks/new'
    end
    
end
  
  


  #show route for a task 
  get '/tasks/:id' do
    not_logged_in?
    @task = Task.find(params[:id])
    erb :'/tasks/show'
  end
  
  
  
  
  get '/tasks/:id/edit' do
    not_logged_in?
    @task = Task.find(params[:id])
   
      if @task.user == current_user
        erb :'/tasks/edit'
      else
        redirect "users/#{current_user.id}"
       end   
  
  end  
     


  patch '/tasks/:id' do
    not_logged_in?
    #find task
    @task = Task.find(params[:id])
  
      if @task.user==current_user
        #modify the task
        @task.update(content: params[:content])
        #redirect to show page
       redirect "/tasks/#{@task.id}"
      else
    
      redirect "/tasks/#{current_user.id}"
    
      end
    
  end
  
  
  
  delete '/tasks/:id' do
    not_logged_in?
    @task = Task.find(params[:id]) 
    if authorized_to_edit?(@task)
      @task.destroy
      redirect '/tasks'
    else
      redirect '/tasks'
     end
  
  end

end