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

  end

  def self.all()

  end

  def self.find(id)

  end

  def self.delete(id)

  end

  def save()

  end

  def update()

  end

  def movie()

  end

  def actor()

  end

end
