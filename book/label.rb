class Label
  attr_reader :title, :color, :id
  attr_accessor :items

  def initialize(title, color, id: nil)
    @id = id || SecureRandom.random_number(1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self unless item.label == self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items
    }.to_json(*args)
  end
end
