class AlbumCreator
  @user_input = ''

  def self.switch_case(ans)
    case ans
    when 'y'
      true
    when 'n'
      false
    else
      puts "Please Enter Y/y for 'YES' and N/n for 'No' \n Answer: "
      answer = gets.chomp.downcase
      switch_case(answer)
    end
  end

  def self.create_album(music_albums, genres)
    puts 'Date of publish [dd/mm/yy]:'
    print 'Answer: '
    @publish_date = gets.chomp.downcase

    puts 'Is the album archived or not? [Y | N]'
    print "\nAnswer: "
    user_answer = gets.chomp.downcase
    @archived = AlbumCreator.switch_case(user_answer)

    puts 'Is the album on spotify? [Y | N]'
    print "\nAnswer: "
    user_answer = gets.chomp.downcase
    @on_spotify = AlbumCreator.switch_case(user_answer)

    album = MusicAlbum.new(@publish_date, @archived, @on_spotify)

    new_genre = GenreCreator.new
    album.genre = new_genre.create_genre(genres)
    # find album
    # find genre with album.genre.id

    music_albums << album
    puts "\nMusic album created successfully"
  end
end
