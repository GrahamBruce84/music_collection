require 'pry-byebug'
require_relative 'artists'
require_relative 'albums'

artist1 = Artists.new({
  'name' => 'Will Smith'
  })
artist1.save()

artist2 = Artists.new({
  'name' => 'Eminem'
  })
artist2.save()

album1 = Albums.new({
  'title' => 'Lost and Found',
  'genre' => 'hip hop'
  })
album1.save()

album2 = Albums.new({
  'title' => 'Recovery',
  'genre' => 'rap'
  'artist' => artist2.id
  })
album2.save()


binding.pry
nil