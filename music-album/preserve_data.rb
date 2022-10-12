require 'json'
require 'set'

class PreserveData
  def self.store_albums(albums)
    data = []
    file = './albums.json'
    albums.each do |album|
      data << { publish_date: album.publish_date, archived: album.archived, id: album.id, on_spotify: album.on_spotify,
                genre: album.genre.id }
    end
    File.write(file, JSON.pretty_generate(data))
  end

  def self.load_albums(genres)
    data = []
    file = './albums.json'
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |album|
        new_album = MusicAlbum.new(album['publish_date'], album['archived'], album['on_spotify'])
        new_album.id = album['id']
        genre = genres.find do |g|
          g.id == album['genre']
        end
        new_album.genre = genre
        data << new_album
      end
    end
    data
  end

  def self.store_genres(genres)
    data = Set.new
    file = './genres.json'
    genres.each do |genre|
      data << { name: genre.name, id: genre.id }
    end
    File.write(file, JSON.pretty_generate(data.to_a))
  end

  def self.load_genres
    file = './genres.json'
    data = []
    if File.exist?(file)
      JSON.parse(File.read(file)).each do |genre|
        saved_genre = Genre.new(genre['name'])
        saved_genre.id = genre['id']
        data << saved_genre
      end
    end
    data
  end
end
