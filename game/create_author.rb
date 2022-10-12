require_relative 'author'
require_relative '../data_values'

class CreateAuthor
  include DataValues
  def initialize
    @author_list = DataValues.authors
  end

  def add_author
    puts 'Enter  author first name: '
    first_name = gets.chomp

    puts 'Enter  author last name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    puts 'The author was published successfully!'
    @author_list << author unless @author_list.include?(author)
    author
  end

  def list_authors
    if @author_list.empty?
      puts 'Please ADD some authors...'
    else
      @author_list.each_with_index do |author, index|
        puts "(#{index})-> Name: #{author.first_name} #{author.last_name} "
      end
    end
  end

  def set_author
    index_of_author = gets.chomp.to_i
    @author_list[index_of_author]
  end

  def choose_author
    puts "\n[1] Choose a author or [2] Create a new author"
    num = gets.chomp.to_i
    case num
    when 1
      list_authors
      set_author
    when 2
      add_author
    end
  end
end
