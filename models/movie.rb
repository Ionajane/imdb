require_relative("../db/sql_runner.rb")

class Movie

  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
  end


end
