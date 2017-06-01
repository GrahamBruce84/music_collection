require ('pg')
require_relative ('db/sql_runner')

class Albums

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id']
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Albums.new(album)}
  end

  def save()
    sql = "INSERT INTO albums (title, genre) VALUES ('#{@title}', '#{@genre}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET ('id', 'title', 'genre', 'artist_id') = ('#{@id}', '#{@title}', '#{@genre}', '#{@artist_id}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def find()

  end 

end