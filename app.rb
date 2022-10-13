require_relative './music-album/preserve_data'
require_relative './music-album/create_music_album'
require_relative './music-album/create_genre'
require_relative './music-album/music_album'
require_relative './music-album/lists'
require_relative './music-album/genre'
require_relative './item'

require_relative './game/create_game'
require_relative './game/game_data'
require_relative './book/create_book'
require_relative './book/create_label'
require_relative './book/book_data'

class App
  attr_accessor :music_albums, :genres, :games, :authors

  def initialize
    @user_options = 0
    @genres = PreserveData.load_genres
    @music_albums = PreserveData.load_albums(@genres)
    @game = CreateGame.new
    @author = CreateAuthor.new
    @book = CreateBook.new
    @label = CreateLabel.new
    @book_data = BookData.new
    @game_data = GameData.new
  end

  def list_options
    case @user_options
    when 1
      @book.list_books
    when 2
      List.list_all_music_albums(@music_albums)
    when 3
      @label.list_labels
    when 4
      List.list_all_genres(@genres)
    when 5
      @game.list_games
    end
  end

  def add_options
    case @user_options
    when 6
      @author.list_authors
    when 7
      @book.add_book
    when 8
      AlbumCreator.create_album(@music_albums, @genres)
    when 9
      @game.add_game
    when 10
      exit_app
    else
      puts 'Enter a valid option (1 - 10)'
    end
  end

  def dashboard
    puts "
        Please choose an option by entering a number from below:\n
        [1] - List All Books
        [2] - List All Music Albums
        [3] - List All Labels
        [4] - List All Genres
        [5] - List All Games
        [6] - List All Authors
        [7] - Add a Book
        [8] - Add a Music Album
        [9] - Add a Game
        [10] - Exit

        Type your option"
    @user_options = gets.chomp.to_i
    list_options
    add_options
    dashboard
  end

  def run
    system('clear')
    @game_data.load_authors
    @game_data.load_games
    @book_data.load_books
    @book_data.load_labels
    dashboard
  end

  def exit_app
    puts 'Thank you for using this app'
    @book_data.save_files
    @game_data.save_files
    PreserveData.store_albums(@music_albums)
    PreserveData.store_genres(@genres)
    exit
  end
end
