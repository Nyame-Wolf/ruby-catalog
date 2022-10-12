require_relative './label'
require_relative '../data_values'

class CreateLabel
  include DataValues

  def initialize
    @label_list = DataValues.labels
  end

  def choose_label
    puts "\n[1] Choose a label or [2] Create a new label"
    num = gets.chomp.to_i
    case num
    when 1
      list_labels
      set_label
    when 2
      add_label
    end
  end

  def add_label
    puts 'Enter Label Name:'
    title = gets.chomp.capitalize
    puts 'Enter Label Color'
    color = gets.chomp.capitalize
    label = Label.new(title, color)
    @label_list << label
    label
  end

  def set_label
    index_of_label = gets.chomp.to_i
    @label_list[index_of_label]
  end

  def list_labels
    if @label_list.empty?
      puts 'Please ADD some Labels...'
      choose_label
    else
      @label_list.each_with_index do |label, index|
        puts "#{index}) Title: #{label.title},  Color: #{label.color}"
        p label.items
      end
    end
  end
end
