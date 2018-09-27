require_relative("./models/actor.rb")
require_relative("./models/movie.rb")
require_relative("./models/role.rb")
require('pry')

Actor.delete_all()
Movie.delete_all()
Role.delete_all()

#---
actor1 = Actor.new({
  "f_name" => "Chris",
  "l_name" => "Hemsworth"
  })
actor1.save()

actor2 = Actor.new ({
  "f_name" => "Scarlett",
  "l_name" => "Johansson"
  })
actor2.save()

actor3 = Actor.new({
  "f_name" => "Tom",
  "l_name" => "Holland"
  })
actor3.save()
#---

movie1 = Movie.new ({
  "title" => "Avengers: Infinity War",
  "genre" => "Action"
  })
movie1.save()

movie2 = Movie.new ({
  "title" => "Spider-man Homecoming",
  "genre" => "Action"
  })
movie2.save()

movie3 = Movie.new ({
  "title" => "Under the skin",
  "genre" => "Thriller"
  })
movie3.save()
#---

role1 = Role.new ({
  "actor_id" => actor1.id,
  "movie_id" => movie1.id,
  "fee" => 4
  })
role1.save()

role2 = Role.new ({
  "actor_id" => actor2.id,
  "movie_id" => movie1.id,
  "fee" => 10
  })
role2.save()

role3 = Role.new ({
  "actor_id" => actor3.id,
  "movie_id" => movie1.id,
  "fee" => 6
  })
role3.save()

role4 = Role.new ({
  "actor_id" => actor3.id,
  "movie_id" => movie2.id,
  "fee" => 8
  })
role4.save()

role5 = Role.new ({
  "actor_id" => actor2.id,
  "movie_id" => movie3.id,
  "fee" => 15
  })
role5.save()

movies = Movie.all()
actors = Actor.all()
roles = Role.all()

binding.pry
nil
