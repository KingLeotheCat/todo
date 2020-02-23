#I will create seed data to work with and test asoociations


lenny = User.create(name: "Lenny", email: "lennylee91@gmail.com", password: "213")
nelly = User.create(name: "Nelly", email: "AnellyPerez123@gmail.com", password: "213")

Task.create(content: "Today is Thursday", user_id: lenny.id)

lenny.tasks.create(content: "Building a Sinatra app")


nellys_entry = nelly.tasks.build(content: "bubushka!")
nellys_entry.save

