require_relative '../item'

class Author < Item
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name:, last_name:, publish_date: nil, id: nil)
    super(publish_date, id)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item:)
    @items.push(item)
    item.author = self
  end
end
