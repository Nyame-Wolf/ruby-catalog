class Author
  attr_accessor :items
  attr_reader :id, :first_name, :last_name

  def initialize(first_name, last_name, id: nil)
    @first_name = first_name
    @last_name = last_name
    @id = id || SecureRandom.random_number(1000)
    @items = []
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name
    }.to_json(*args)
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self unless item.author == self
  end
end
