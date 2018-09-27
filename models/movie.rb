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

  end

  def update()

  end

end
