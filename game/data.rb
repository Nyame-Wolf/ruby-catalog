require_relative '../data_values'
require 'json'

class Data
  def initialize
    @games_list = DataValues.games
    @authors_list = DataValues.authors
  end

  def load_games
    if File.exist?('./games.json')
      games_data = JSON.parse(File.read('./games.json'), create_additions: true)
      games_data.each do |game|
        single_game = Game.new(game['multiplayer'], game['last_played_at'])
        @games_list << single_game unless @games_list.include?(single_game)
      end
    else
      []
    end
  end

  def load_authors
    if File.exist?('./authors.json')
      authors_data = JSON.parse(File.read('./authors.json'), create_additions: true)
      authors_data.each do |author|
        single_author = Author.new(author['first_name'], author['last_name'], id: author['id'])
        @authors_list << single_author
      end
    else
      []
    end
  end

  def save_files
    File.write('./games.json', JSON.pretty_generate(@games_list))
    File.write('./authors.json', JSON.pretty_generate(@authors_list))
  end
end
