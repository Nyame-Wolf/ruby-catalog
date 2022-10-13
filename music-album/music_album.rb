require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  def initialize(on_spotify, id: nil, publish_date: nil)
    super(id, publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end
