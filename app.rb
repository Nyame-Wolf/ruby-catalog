class App
  def initialize
    @user_options = 0
  end

  def list_options
    case @user_options

    when 1
      '1 -> List all books'
    when 2
      '2 -> List all music albums'
    when 3
      '3 -> List all labels'
    when 4
      '4 -> List all music albums'
    when 5
      '5 -> List all genres'
    when 6
      '6 -> List all games'
    end
  end

  def add_options
    case @user_options
    when 7
      '7 -> List all authors'
    when 8
      '8 -> Add book'
    when 9
      '9 -> Add music album'
    when 10
      '10 -> Add a game'
    when 11
      '11 -> Exit App'
    else
      puts 'Enter a valid option (1 - 11)'
    end
  end

  def dashboard
    puts 'Please choose an option by entering a number from below\n'
    @user_options = gets.chomp.to_i
    list_options
    add_options

  end

  def run
    dashboard
  end
end

