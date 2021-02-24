require_relative 'ttc_board'
require_relative 'ttc_player'

class Game
  attr_reader :board, :first, :second

  def initialize
    @board = Board.new.board
    @first = Player.new
    @second = Player.new
  end

  def update_board(cell, sign)
    sign = 'X'
    @board[cell] = sign
  end
end
