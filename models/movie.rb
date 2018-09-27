require_relative("../db/sql_runner.rb")

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
  end

  def self.delete_all()
    sql = 'DELETE FROM movies;'
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM movies;'
    movies = SqlRunner.run(sql)
    result = movies.map {|movie| Movie.new(movie)}
    return result
  end

  def self.find(id)

  end

  def self.delete(id)

  end

  def save()
    sql = "INSERT INTO movies(title, genre)
    VALUES ($1, $2) RETURNING id;"
    values = [@title, @genre]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = 'UPDATE movies SET title = $1, genre = $2
    WHERE id = $3'
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def actor()
    sql = 'SELECT actors.* FROM actor
    INNER JOIN roles
    ON actors.id = roles.actor_id
    WHERE movie_id = $1;'
    actors = SqlRunner.run(sql, values)
    result = actors.map {|actor| Actor.new(actor)}
  end

end
