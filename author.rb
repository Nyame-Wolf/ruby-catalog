require_relative 'item'

class Author < Item
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(publish_date, first_name:, last_name:, id: nil)
    super
    @first_name = first_name
    @last_name = last_name
  end

end
