require_relative 'ttc_board'
require_relative 'ttc_player'

class Game
  attr_reader :board, :one, :two

  def initialize
    @board = Board.new.board
    @one = Player.new
    @two = Player.new
    @old_moves = []
    set_player_sign
  end

  def set_player_sign
    @one.sign = 'X'
    @two.sign = 'O'
  end

  def get_input
    puts "Enter a number between 0 and 9"
    gets.chomp
  end

  def validate_input
    choice = get_input
    loop do
      break if new_move?(choice) && choice.match?(/^[0-9]$/)

      puts 'Enter a new move'
      choice = get_input
    end
    return choice
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
    player == @one ? @board[move] = @one.sign : @board[move] = @two.sign
  end
end
