require_relative 'ttc_board'

class Player
  attr_reader :name
  attr_accessor :score

  def initialize
    @name = set_name
    @score = 0
  end

  def set_name
    puts 'Enter the player name'
    input = gets.chomp
  end

  def make_move
    gets.chomp.to_i
  end
end
