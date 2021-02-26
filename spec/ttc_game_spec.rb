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

  
  describe "#udpate_board" do
    subject(:game_board_update) { described_class.new }

    it "updates the board with the first player choice" do
      cell = 1
      game_board_update.update_board(cell, game_board_update.first)
      expect(game_board_update.board[1]).to eq('X')
    end

    it "updates the board with the second player choice" do
      cell = 1
      game_board_update.update_board(cell, game_board_update.second)
      expect(game_board_update.board[1]).to eq('O')
    end
  end
end