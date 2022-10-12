require 'date'
require 'securerandom'

class Item
  attr_accessor :publish_date, :archived, :id
  attr_reader :author, :label, :genre

  def initialize(publish_date, archived)
    @id = nil || SecureRandom.random_number(1000)
    @publish_date = publish_date
    @archived = archived
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
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
