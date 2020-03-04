Specs:

 [x] Use Sinatra to build the app
      -Used Corneal to create a frame for application
      -Sets up Sinatra environment in environment.rb
  
 [x] Use ActiveRecord for storing information in a database
      -Establish connection in environment file
      -Inherits in model classes
 
 [x] Include more than one model class (e.g. User, Post, Category)
      -user.rb and task.rb
 
 [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
 [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
      -task belongs_to user which has_many tasks

 [x] Include user accounts with unique login attribute (username or email)
      -Accounts have username, email, and password
      
 [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
      -In tasks_controller.rb - has get routes for reading, post route for creating, patch route for updating, and delete route for destroying
 
 [x] Ensure that users can't modify content created by other users
 Include user input validations
      -Authentication methods in application controller and users controller for starting a session.
      
 [] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
 
 [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code


Confirm

 [x] You have a large number of small Git commits
 
 [x] Your commit messages are meaningful
 
 [x] You made the changes in a commit that relate to the commit message
 
 [x] You don't include changes in a commit that aren't related to the commit message


 