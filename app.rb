require_relative './music-album/preserve_data'
require_relative './music-album/create_music_album'
require_relative './music-album/create_genre'
require_relative './music-album/music_album'
require_relative './music-album/lists'
require_relative './music-album/genre'
require_relative './item'

class App
  attr_accessor :music_albums, :genres

  def initialize
    @user_options = 0
    # @music_albums = []
    @genres = PreserveData.load_genres
    @music_albums = PreserveData.load_albums(@genres)
  end

  def list_options
    case @user_options
    when 1
      puts '1 -> List all books'
    when 2
      puts '2 -> List all music albums'
      List.list_all_music_albums(@music_albums)
    when 3
      puts '3 -> List all labels'
    when 4
      puts '4 -> List all genres'
      List.list_all_genres(@genres)
    when 5
      puts '5 -> List all games'
    end
  end

  def add_options
    case @user_options
    when 6
      puts '6 -> List all authors'
    when 7
      puts '7 -> Add book'
    when 8
      puts '8 -> Add music album'
      AlbumCreator.create_album(@music_albums, @genres)
    when 9
      puts '9 -> Add a game'
    when 10
      exit_app
    else
      puts 'Enter a valid option (1 - 11)'
    end
  end

  def dashboard
    puts 'Please choose an option by entering a number from below\n'
    @user_options = gets.chomp.to_i
    list_options
    add_options
    dashboard
  end

  def run
    dashboard
  end

  def exit_app
    puts 'Thank you for using this app'
    # add save json files
    PreserveData.store_albums(@music_albums)
    PreserveData.store_genres(@genres)
    exit
  end
end
