require_relative 'board'

class Player
  attr_reader :name
  attr_accessor :score, :sign

  def initialize
    @name = set_name
    @score = 0
    @sign = sign
  end

  def set_name
    puts 'Enter the player name'
    gets.chomp
  end
end
