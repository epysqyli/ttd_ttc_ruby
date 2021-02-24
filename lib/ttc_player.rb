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

  def verify_input(input)
    return input if input.match?(/^[0-9]$/)
  end

end
