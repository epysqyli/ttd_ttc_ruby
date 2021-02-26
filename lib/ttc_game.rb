require_relative 'ttc_board'
require_relative 'ttc_player'

class Game
  attr_reader :board, :first, :second

  def initialize
    @board = Board.new.board
    @first = Player.new
    @second = Player.new
    @old_moves = []
    set_player_sign
  end

  def set_player_sign
    @first.sign = 'X'
    @second.sign = 'O'
  end

  def set_cell(player)
    player == @first ? @first.enter_position : @second.enter_position
  end

  def record_move(player)
    @old_moves << set_cell(player)
  end

  def update_board(player)
    player == @first ? @board[set_cell(player)] = @first.sign : @board[set_cell(player)] = @second.sign
  end
end
