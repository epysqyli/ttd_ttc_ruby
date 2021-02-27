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
    # puts 'Enter the player name'
    gets.chomp
  end
end
