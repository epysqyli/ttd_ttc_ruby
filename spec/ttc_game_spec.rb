require_relative '../lib/ttc_game'

describe Game do

  describe '#set_player_sign' do
    subject(:game_signs) { described_class.new }

    context 'when the game is started' do
      it "sets the sign 'X' to player 1 and 'O' to player 2" do
        first_sign = game_signs.first.sign
        second_sign = game_signs.second.sign
        expect(first_sign).to eq('X')
        expect(second_sign).to eq('O')
      end
    end
  end

  describe '#record_move' do
    subject(:game_record) { described_class.new }

    it 'stores in an array the player move to avoid repetition' do
      old_moves = game_record.instance_variable_get(:@old_moves)
      move = '5'
      game_record.record_move(move)
      expect(old_moves.include?(move)).to be_truthy
    end
  end

  describe '#new_move?' do
    subject(:game_move) { described_class.new }

    it 'is truthy if the move is new' do
      old_moves = game_move.instance_variable_get(:@old_moves)
      move = '5'
      expect(game_move.new_move?(move)).to be_truthy
    end

    it 'is falsy if the move is old' do
      old_moves = game_move.instance_variable_get(:@old_moves)
      move = '5'
      game_move.record_move(move)
      expect(game_move.new_move?(move)).to be_falsy
    end
  end

  describe "#set_cell" do
    subject(:game_cell) { described_class.new }

    xit 'specifies which cell the player is using and validates the move' do
      # stub to avoid loop
      allow(game_cell.first).to receive(:enter_position).and_return('5')
      expect(game_cell.set_cell(game_cell.first)).to eq('5')
    end
  end

  describe "#udpate_board" do
    subject(:game_board) { described_class.new }

    it "updates the board with the first player choice" do
      player = game_board.first
      # stub to avoid loop
      allow(game_board.first).to receive(:enter_position).and_return('5')
      expect(game_board.update_board(player)).to eq('X')
    end

    it "updates the board with the second player choice" do
      player = game_board.second
      # stub to avoid loop
      allow(game_board.second).to receive(:enter_position).and_return('5')
      expect(game_board.update_board(player)).to eq('O')
    end
  end
end