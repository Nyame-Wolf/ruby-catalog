require 'securerandom'
class Genre
  attr_accessor :name, :id, :items
  def initialize(name, id: nil)
    @id = id || SecureRandom.random_number(1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
