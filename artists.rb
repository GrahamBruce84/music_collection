require ('pg')
require_relative ('db/sql_runner')

class Artists

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artists.new(artist)}
  end 

end