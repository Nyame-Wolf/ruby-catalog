require_relative './music-album/preserve_data'
require_relative './music-album/create_music_album'
require_relative './music-album/create_genre'
require_relative './music-album/music_album'
require_relative './music-album/lists'
require_relative './music-album/genre'
require_relative './item'

require_relative './game/create_game'
require_relative './game/data'
require_relative './book/create_book'
require_relative './book/create_label'
require_relative './book/data'

class App
  attr_accessor :music_albums, :genres, :games, :authors

  def initialize
    @user_options = 0
    @games = []
    @authors = []
    @genres = PreserveData.load_genres
    @music_albums = PreserveData.load_albums(@genres)
    @game = CreateGame.new
    @author = CreateAuthor.new
    @book = CreateBook.new
    @label = CreateLabel.new
    @data = Data.new
  end

  def list_options
    case @user_options
    when 1
      puts '1 -> List all books'
      @book.list_books
    when 2
      puts '2 -> List all music albums'
      List.list_all_music_albums(@music_albums)
    when 3
      puts '3 -> List all labels'
      @label.list_labels
    when 4
      puts '4 -> List all genres'
      List.list_all_genres(@genres)

    when 5
      puts '5 -> List all games'
      @game.list_games
    end
  end

  def add_options
    case @user_options
    when 6
      puts '6 -> List all authors'
      @author.list_authors
    when 7
      puts '7 -> Add book'
      @book.add_book
    when 8
      puts '8 -> Add music album'
      AlbumCreator.create_album(@music_albums, @genres)
    when 9
      puts '9 -> Add a game'
      @game.add_game
    when 10
      exit_app
    else
      puts 'Enter a valid option (1 - 11)'
    end
  end

  def dashboard
    puts "Please choose an option by entering a number from below\n"
    @user_options = gets.chomp.to_i
    list_options
    add_options
    dashboard
  end

  def run
    @data.load_authors
    @data.load_games
    system('clear')
    @data.load_books
    @data.load_labels
    dashboard
  end

  def exit_app
    @data.save_files
    puts 'Thank you for using this app'
    @data.save_files
    # add save json files
    PreserveData.store_albums(@music_albums)
    PreserveData.store_genres(@genres)
    exit
  end
end
