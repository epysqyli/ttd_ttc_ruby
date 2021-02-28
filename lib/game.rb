require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :one, :two

  def initialize
    @board = Board.new.board
    @one = Player.new
    @two = Player.new
    @old_moves = []
    @round_over = false
    @turn_count = 0
    set_player_sign
  end

  def display
    puts "\t| #{@board['1']} | #{@board['2']} | #{@board['3']} | "
    puts "\t| #{@board['4']} | #{@board['5']} | #{@board['6']} | "
    puts "\t| #{@board['7']} | #{@board['8']} | #{@board['9']} | "
  end

  def clean_board
    @board = Board.new.board
    @old_moves = []
  end

  def set_player_sign
    @one.sign = 'X'
    @two.sign = 'O'
  end

  def set_first
    random = rand(1..10)
    random.even? ? @one : @two
  end

  def set_order
    pair = []
    turns = []
    first = set_first
    first == @one ? pair = [@two, @one] : pair = [@one, @two]
    turns.push(pair) until turns.length == 4
    turns.flatten!.unshift(first)
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

  def check_round
    if (@board['1'] == @board['2'] && @board['2'] == @board['3'] && board['3'] == @one.sign) || (@board['4'] == @board['5'] && @board['5'] == @board['6'] && board['6'] == @one.sign) || (@board['7'] == @board['8'] && @board['8'] == @board['9'] && board['9'] == @one.sign) || (@board['1'] == @board['4'] && @board['4'] == @board['7'] && board['7'] == @one.sign) || (@board['2'] == @board['5'] && @board['5'] == @board['8'] && board['8'] == @one.sign) || (@board['3'] == @board['6'] && @board['6'] == @board['9'] && board['9'] == @one.sign) || (@board['1'] == @board['5'] && @board['5'] == @board['9'] && board['9'] == @one.sign) || (@board['3'] == @board['5'] && @board['5'] == @board['7'] && board['7'] == @one.sign)
      @one.score += 1
      @round_over = true
    elsif (@board['1'] == @board['2'] && @board['2'] == @board['3'] && board['3'] == @two.sign) || (@board['4'] == @board['5'] && @board['5'] == @board['6'] && board['6'] == @two.sign) || (@board['7'] == @board['8'] && @board['8'] == @board['9'] && board['9'] == @two.sign) || (@board['1'] == @board['4'] && @board['4'] == @board['7'] && board['7'] == @two.sign) || (@board['2'] == @board['5'] && @board['5'] == @board['8'] && board['8'] == @two.sign) || (@board['3'] == @board['6'] && @board['6'] == @board['9'] && board['9'] == @two.sign) || (@board['1'] == @board['5'] && @board['5'] == @board['9'] && board['9'] == @two.sign) || (@board['3'] == @board['5'] && @board['5'] == @board['7'] && board['7'] == @two.sign)
      @two.score += 1
      @round_over = true
    end
  end

  def check_score
    if @one.score == 2
      message = "Player #{@one.name} wins"
      puts message
      @game_over = true
    elsif @two.score == 2
      message = "Player #{@two.name} wins"
      puts message
      @game_over = true
    elsif @turn_count == 3 && @one.score == @two.score
      message = "Nobody wins"
      puts message
      @game_over = true
    end
    return message
  end

  def play_turn
    turns = set_order
    until turns.empty? || @round_over == true
      player = turns.shift
      puts "Player #{player.name.capitalize}, it is your turn"
      update_board(player)
      display
      check_round
    end
    @turn_count += 1
    @round_over = false
    clean_board
    puts "---NEW TURN IS STARTING---"
    sleep 1
  end

  def play
    until @game_over == true
      play_turn
      check_score
    end
  end
end

game = Game.new
game.play