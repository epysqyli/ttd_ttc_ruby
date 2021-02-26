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

  def get_input
    puts "Enter a number between 0 and 9"
    gets.chomp
  end

  def validate_input
    choice = get_input
    choice if new_move?(choice) && choice.match?(/^[0-9]$/)
  end

  def new_move?(move)
    !@old_moves.include?(move)
  end

  def record_move(move)
    @old_moves << move
  end

  def update_board(player)
    move = validate_input
    record_move(move)
    player == @first ? @board[move] = @first.sign : @board[move] = @second.sign
  end
end
