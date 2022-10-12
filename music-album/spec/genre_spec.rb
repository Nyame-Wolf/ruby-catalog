require_relative '../genre'
describe Genre do
  context 'Testing Genre' do
    it 'it creates a genre instance' do
      genre = Genre.new('Pop')
      expect(genre.name).to eq('Pop')
    end
  end
end
