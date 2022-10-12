require_relative 'game'
require_relative 'create_author'

class CreateGame
  include DataValues
  def initialize
    @game_list = DataValues.games
  end

  def add_game
    puts 'Enter  Multiplayer: '
    multiplayer = gets.chomp
    puts 'When was the last played (day/month/year): '
    last_played_at = gets.chomp
    game = Game.new(multiplayer, last_played_at)

    new_author = CreateAuthor.new
    game.author = new_author.choose_author
    puts 'The game was published successfully!'
    @game_list << game unless @game_list.include?(game)
  end

  def list_games
    if @game_list.empty?
      puts 'Please ADD some games...'
    else
      @game_list.each_with_index do |game, index|
        puts "#{index + 1}) multiplayer: #{game.multiplayer}, "
        puts "Last played at: #{game.last_played_at}"
      end
    end
  end
end
