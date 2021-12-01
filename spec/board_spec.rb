require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#initialize' do
    it 'creates a Hash for the board' do
      expect(board.board).to be_an(Hash)
    end
  end
end
