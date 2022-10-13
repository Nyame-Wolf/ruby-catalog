require_relative '../game/author'

describe Author do
  before(:each) do
    @author = Author.new('Raul', 'Raminka')

  end

  context '#new' do
    it 'is an instance of Game and takes 2 parameter' do
      expect(@author).to be_instance_of(Author)
    end

    it 'gives Argument error when more or less than 2 params given' do
      expect { Author.new('Raul') }.to raise_error(ArgumentError)
    end
  end

  context '#first_name' do
    it 'can be read' do
      expect(@author.first_name).to eql('Raul')
    end

    it 'can not be written' do
      expect { @author.first_name = 'Deen' }.to raise_error(NoMethodError)
    end
  end

  context '#last_name' do
    it 'can be read' do
      expect(@author.last_name).to eql('Raminka')
    end

    it 'can not be written' do
      expect { @author.last_name = 'Elias' }.to raise_error(NoMethodError)
    end
  end


  context '#add_item' do
    it 'takes item object as parameter and sets the label of the item' do
      mocked_item = spy('item')
      allow(mocked_item).to receive(:label=) { [] }
      expect(@author.add_item(mocked_item)).to equal(@author)
    end

    it 'giver error if more or less than 1 parameter as input' do
      expect { @author.add_item }.to raise_error(ArgumentError)
    end
  end
end
