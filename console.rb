require_relative("./models/actor.rb")
require_relative("./models/movie.rb")
require_relative("./models/role.rb")
require('pry')

Actor.delete_all()
Movie.delete_all()
Role.delete_all()

movies = Movie.all

binding.pry
nil
