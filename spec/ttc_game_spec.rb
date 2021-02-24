require_relative '../lib/ttc_game'

describe Game do
  describe "#udpate_board" do
    subject(:game_board_update) { described_class.new }

    it "updates the board with the current player choice if available" do
      input = 'X'
      cell = 1
      game_board_update.update_board(cell, input)
      expect(board[1]).to eq('X')
    end
  end
end