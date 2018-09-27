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

end
