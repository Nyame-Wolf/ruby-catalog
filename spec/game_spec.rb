require_relative '../game/game'

describe Game do
  before(:each) do
    @game = Game.new('2', '02/02/2022')
  end

  context '#new' do
    it 'is an instance of Game and takes 2 parameter' do
      expect(@game).to be_instance_of(Game)
    end

    it 'gives Argument error when more or less than 2 params given' do
      expect { Game.new('2') }.to raise_error(ArgumentError)
    end

    it 'is a child of Item' do
      expect(@game).to be_kind_of(Item)
    end
  end

  context '#multiplayer' do
    it 'can be read' do
      expect(@game.multiplayer).to eql('2')
    end

    it 'can not be written' do
      expect { @game.multiplayer = '3' }.to raise_error(NoMethodError)
    end
  end

  context '#last_played_at' do
    it 'can be read' do
      expect(@game.last_played_at).to eql('02/02/2022')
    end

    it 'can not be written' do
      expect { @game.last_played_at = '03/03/2023' }.to raise_error(NoMethodError)
    end
  end

  context '#can_be_achived' do
    it 'should return false otherwise' do
      bad_game = Game.new('2', '02/02/2022')
      expect(bad_game.move_to_archive).to be false
    end
  end
end
