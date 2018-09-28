require_relative("../db/sql_runner.rb")

class Actor

  attr_reader :id
  attr_accessor :f_name, :l_name

  def initialize(options)
    @id = options['id'].to_i
    @f_name = options['f_name']
    @l_name = options['l_name']
  end

  def self.delete_all()
    sql = 'DELETE FROM actors;'
    SqlRunner.run(sql)
  end

  def self.all()
    sql = 'SELECT * FROM actors;'
    actors = SqlRunner.run(sql)
    result = actors.map {|actor| Actor.new(actor)}
    return result
  end

  def self.find(id)
  end

  def self.delete(id)
  end

  def save()
    sql = "INSERT INTO actors(f_name, l_name)
    VALUES ($1, $2) RETURNING id;"
    values = [@f_name, @l_name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = 'UPDATE actors
    SET f_name = $1, l_name = $2
    WHERE id = $3;'
    values = [@f_name, @l_name, @id]
    SqlRunner.run(sql, values)
  end

  def movie()
    sql = 'SELECT movies.* FROM movie
    INNER JOIN roles
    ON movies.id = roles.movie_id
    WHERE actor_id = $1;'
    actors = SqlRunner.run(sql, values)
    result = movies.map {|movie| Movie.new(movie)}
  end

end
