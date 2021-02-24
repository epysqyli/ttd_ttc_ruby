require_relative 'ttc_board'

class Player
  attr_reader :name
  attr_accessor :score

  def initialize
    # @name = set_name
    @score = 0
  end

  def set_name
    puts 'Enter the player name'
    input = gets.chomp
  end

  def enter_position
    puts 'Enter a valid position between 1 and 9'
    gets.chomp
  end

  def verify_position(input)
    input.match?(/^[0-9]$/)
  end

  def validate_position
    enter_position until verify_position(enter_position)
  end
end
