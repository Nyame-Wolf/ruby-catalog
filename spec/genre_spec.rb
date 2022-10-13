require_relative '../music-album/genre'

describe Genre do
  context 'Testing Genre' do
    genre = Genre.new('Pop')
    it 'it creates a genre instance' do
      expect(genre.name).to eq('Pop')
    end
    it 'is an instance of genre and takes 3 parameter' do
      expect(genre).to be_instance_of(Genre)
    end
  end
end
