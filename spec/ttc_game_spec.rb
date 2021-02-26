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

  describe '#validate_input' do
    subject(:game_input) { described_class.new }

    context 'when the player inputs a position' do
      it 'checks the input for repetition and validity' do
        input = '3'
        allow(game_input).to receive(:get_input).and_return(input)
        expect(game_input.validate_input).to eq(input)
      end
    end
  end

  describe "#udpate_board" do
    subject(:game_board) { described_class.new }

    it "updates the board with the first player choice" do
      first = game_board.instance_variable_get(:@first)
      board = game_board.instance_variable_get(:@board)
      # stub to avoid loop
      allow(game_board).to receive(:validate_input).and_return('5')
      game_board.update_board(first)
      expect(board['5']).to eq('X')
    end

    it "updates the board with the second player choice" do
      second = game_board.instance_variable_get(:@second)
      board = game_board.instance_variable_get(:@board)
      allow(game_board).to receive(:validate_input).and_return('3')
      game_board.update_board(second)
      expect(board['3']).to eq('O')
    end
  end
end