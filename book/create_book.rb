require_relative './book'
require_relative '../data_values'

class CreateBook
  include DataValues

  def initialize
    @book_list = DataValues.books
  end

  def add_book
    puts 'Enter BOOK Publisher:'
    publisher = gets.chomp
    puts 'How is the state of the cover? [Good/Bad]:'
    cover_state = gets.chomp.downcase
    while cover_state != 'good' && cover_state != 'bad'
      print 'Please input Good or Bad: '
      cover_state = gets.chomp.downcase
    end
    book = Book.new(publisher, cover_state)
    new_label = CreateLabel.new
    book.label = new_label.choose_label
    puts 'The book was published successfully!'
    @book_list << book unless @book_list.include?(book)
  end

  def list_books
    if @book_list.empty?
      puts 'Please ADD some books...'
    else
      @book_list.each_with_index do |book, index|
        puts "#{index + 1}) Publisher: #{book.publisher.capitalize}, "
        puts "Publish Date: #{book.publish_date}, CoverState: #{book.cover_state.capitalize}"
        puts "Archived: #{book.archived}\n"
      end
    end
  end
end
