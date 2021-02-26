require_relative 'ttc_board'
require_relative 'ttc_player'

class Game
  attr_reader :board, :first, :second

  def initialize
    @board = Board.new.board
    @first = Player.new
    @second = Player.new
    set_player_sign
  end

  def set_player_sign
    @first.sign = 'X'
    @second.sign = 'O'
  end

  def update_board(cell, player)
    player == @first ? @board[cell] = @first.sign : @board[cell] = @second.sign 
  end
end

