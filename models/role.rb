require_relative("../db/sql_runner.rb")

class Role

  attr_reader :id, :actor_id, :movie_id
  attr_accessor :fee

  def initialize(options)
    @id = options['id'].to_i
    @actor_id = options['actor_id'].to_i
    @movie_id = options['movie_id'].to_i
    @fee = options['fee'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM roles;'
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM roles;'
    roles = SqlRunner.run(sql)
    result = roles.map {|role| Role.new(role)}
    return result
  end

  def self.find(id)

  end

  def self.delete(id)

  end

  def save()
    sql = "INSERT INTO roles (actor_id, movie_id, fee)
    VALUES ($1, $2, $3) RETURNING id;"
    values = [@actor_id, @movie_id, @fee]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i()
  end

  def update()
    sql = 'UPDATE roles SET actor_id = $1, movie_id = $2
    WHERE id = $3;'
    values = [@actor_id, @movie_id, @fee, @id]
    SqlRunner.run(sql, values)
  end

  def movie()
    sql = 'SELECT * FROM movies
    WHERE id = $1;'
    result = SqlRunner.run(sql, [@movie_id])
    movie_hash = result[0]
    movie = Movie.new(movie_hash)
     return movie
  end

  def actor()
    sql = 'SELECT * FROM actors
    WHERE id = $1;'
    result = SqlRunner.run(sql, [@actor_id])
    actor_hash = result[0]
    actor = Actor.new(actor_hash)
     return actor
  end

end
