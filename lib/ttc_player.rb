require_relative 'ttc_board'

class Player
  attr_reader :name
  attr_accessor :score
  attr_accessor :sign

  def initialize
    @name = set_name
    @score = 0
    @sign = sign
  end

  def set_name
    #puts 'Enter the player name'
    gets.chomp
  end

  def enter_choice
    puts 'Enter a valid position between 1 and 9'
    gets.chomp
  end

  def verify_choice(input)
    input.match?(/^[0-9]$/)
  end

  def enter_position
    enter_choice until verify_choice(enter_choice)
  end
end
