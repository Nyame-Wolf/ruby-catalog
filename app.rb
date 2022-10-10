class App
  def initialize
    @user_options = 0
  end

  def list_options
    case @user_options

    when 1
      puts '1 -> List all books'
    when 2
     puts '2 -> List all music albums'
    when 3
     puts '3 -> List all labels'
    when 4
      puts '4 -> List all music albums'
    when 5
     puts '5 -> List all genres'
    when 6
     puts '6 -> List all games'
    end
  end

  def add_options
    case @user_options
    when 7
     puts '7 -> List all authors'
    when 8
     puts '8 -> Add book'
    when 9
     puts '9 -> Add music album'
    when 10
     puts '10 -> Add a game'
    when 11
      exit_app
    else
      puts 'Enter a valid option (1 - 11)'
    end
  end

  def dashboard
    puts 'Please choose an option by entering a number from below\n'
    @user_options = gets.chomp.to_i
    list_options
    add_options
    dashboard
  end

  def run
    dashboard
  end

    def exit_app
    puts 'Thank you for using this app'
    # add save json files
    exit
  end
end

