require_relative '../item'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state, id: nil, publish_date: nil)
    super(id, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'label_id' => @label.id,
      'label_title' => @label.title,
      'label_color' => @label.color
    }.to_json(*args)
  end

  private

  def can_be_archived?
    @cover_state == 'bad' || super
  end
end
