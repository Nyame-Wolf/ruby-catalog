require 'date'
require 'securerandom'

class Item
  attr_accessor :publish_date, :archived, :id
  attr_reader :author, :label, :genre

  def initialize(id, publish_date)
    @id = id || SecureRandom.random_number(1000)
    @publish_date = publish_date || DateTime.now.strftime('%m/%d/%Y')
    @archived = move_to_archive
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

  def move_to_archive
    can_be_archived?
  end

  private

  def can_be_archived?
    date = DateTime.now.strftime('%Y').to_i
    publish_year = @publish_date[6..10].to_i
    date - publish_year > 10
  end
end
