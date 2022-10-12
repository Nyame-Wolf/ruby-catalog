require_relative './/item'

class Game < Item
  attr_accessor :date, :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, id: nil, publish_date: nil)
    super(id, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && (DateTime.now.strftime('%Y').to_i - last_played_at[6..10].to_i) > 2
  end
end

# super().