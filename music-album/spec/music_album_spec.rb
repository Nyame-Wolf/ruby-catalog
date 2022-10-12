require_relative '../music_album'
describe MusicAlbum do
  context 'Testing Music album' do
    music_album = MusicAlbum.new('10/10/2010', true, true)
    music_album2 = MusicAlbum.new('02/02/2020', true, true)
    music_album3 = MusicAlbum.new('10/10/2010', true, false)

    it 'creates a new music album insance' do
      expect(music_album.archived).to eq(true)
      expect(music_album.on_spotify).to eq(true)
    end
    it 'can_be_archived method returns true if on_spotify is true' do
      expect(music_album.can_be_archived?).to eq(true)
    end
    it 'can_be_archived method returns false since can be archived time in parent is less' do
      expect(music_album2.can_be_archived?).to eq(false)
    end
    it 'can_be_archived method returns false if on_spotify is false' do
      expect(music_album3.can_be_archived?).to eq(false)
    end
  end
end
