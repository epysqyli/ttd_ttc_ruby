require_relative '../lib/game'

describe Game do

  describe '#set_player_sign' do
    subject(:game_signs) { described_class.new }

    context 'when the game is started' do
      it "sets the sign 'X' to player 1 and 'O' to player 2" do
        one_sign = game_signs.one.sign
        two_sign = game_signs.two.sign
        expect(one_sign).to eq('X')
        expect(two_sign).to eq('O')
      end
    end
  end

  describe '#set_first' do
    subject(:game_first) { described_class.new }

    context 'when the game is started the first to go is set' do
      it 'defines randomly who goes first' do
        first = game_first.set_first
        expect(first).to eq(game_first.one).or(eq(game_first.two))
      end
    end
  end

  describe '#set_order' do
    subject(:game_order) { described_class.new }

    it 'defines the turn order based on #set_first' do
      one = game_order.instance_variable_get(:@one)
      two = game_order.instance_variable_get(:@two)
      allow(game_order).to receive(:set_first).and_return(one)
      turns = game_order.set_order
      expect(turns[0]).to eq(one)
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

    it "updates the board with the one player choice" do
      one = game_board.instance_variable_get(:@one)
      board = game_board.instance_variable_get(:@board)
      # stub to avoid loop
      allow(game_board).to receive(:validate_input).and_return('5')
      game_board.update_board(one)
      expect(board['5']).to eq('X')
    end

    it "updates the board with the two player choice" do
      two = game_board.instance_variable_get(:@two)
      board = game_board.instance_variable_get(:@board)
      # stub to avoid loop
      allow(game_board).to receive(:validate_input).and_return('3')
      game_board.update_board(two)
      expect(board['3']).to eq('O')
    end
  end

  describe '#check_round' do
    subject(:game_round_check) { described_class.new }
    
    context 'when three signs are properly aligned' do
      it 'increases the score of player one by 1 with combo 1-2-3' do
        one = game_round_check.instance_variable_get(:@one)
        board = game_round_check.instance_variable_get(:@board)
        board['1'] = one.sign
        board['2'] = one.sign
        board['3'] = one.sign
        expect{ game_round_check.check_round }.to change { one.score }.by(1)
      end

      it 'increases the score of player two by 1 with combo 1-2-3' do
        two = game_round_check.instance_variable_get(:@two)
        board = game_round_check.instance_variable_get(:@board)
        board['1'] = two.sign
        board['2'] = two.sign
        board['3'] = two.sign
        expect{ game_round_check.check_round }.to change { two.score }.by(1)
      end

      it 'increases the score of player one by 1 with combo 1-5-9' do
        one = game_round_check.instance_variable_get(:@one)
        board = game_round_check.instance_variable_get(:@board)
        board['1'] = one.sign
        board['5'] = one.sign
        board['9'] = one.sign
        expect{ game_round_check.check_round }.to change { one.score }.by(1)
      end
    end
  end

  describe '#check_round?' do
    subject(:game_round_check?) { described_class.new }

    it 'is set to true when one player wins a round' do
      allow(game_round_check?).to receive(:check_round).and_return(true)
      expect(game_round_check?.check_round?).to be_truthy
    end
  end
end