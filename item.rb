require 'date'

class Item
  def initialize(genre, publish_date, archived: false)
    @id = 324
    @genre = genre
    @author = 'author'
    @label = 'label'
    @publish_date = publish_date
    @archived = archived
  end

  def moved_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    date = DateTime.now.strftime('%Y').to_i
    publish_year = @publish_date[6..10].to_i
    date - publish_year > 10
  end
end

item = Item.new('Rock', '10/10/2010')
item.moved_to_archive
