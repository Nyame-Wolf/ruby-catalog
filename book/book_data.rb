require_relative '../data_values'
require 'json'

class BookData
  def initialize
    @book_list = DataValues.books
    @label_list = DataValues.labels
  end

  def load_labels
    if File.exist?('./labels.json')
      labels_data = JSON.parse(File.read('./labels.json'), create_additions: true)
      labels_data.each do |lab|
        label = Label.new(lab['title'], lab['color'], id: lab['id'])
        @label_list << label unless @label_list.include?(label)
      end
    else
      []
    end
  end

  def load_books
    if File.exist?('./books.json')
      books_data = JSON.parse(File.read('./books.json'), create_additions: true)
      books_data.each do |bk|
        book = Book.new(bk['publisher'], bk['cover_state'], id: bk['id'], publish_date: bk['publish_date'])
        label = Label.new(bk['label_title'], bk['label_color'], id: bk['label_id'])
        book.label = label
        @book_list << book
      end
    else
      []
    end
  end

  def save_files
    File.write('./books.json', JSON.pretty_generate(@book_list))
    File.write('./labels.json', JSON.pretty_generate(@label_list))
  end
end
