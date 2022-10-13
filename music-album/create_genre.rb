class GenreCreator
  def create_genre(genres)
    puts "\nAlbum genre?"
    print "\nAnswer: "
    @name = gets.chomp
    genre = Genre.new(@name)
    genres << genre
    genre
  end
end
