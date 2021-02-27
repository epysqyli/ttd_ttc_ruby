class Board
  attr_accessor :board

  def initialize
    @board = { '1' => '-', '2' => '-', '3' => '-',
               '4' => '-', '5' => '-', '6' => '-',
               '7' => '-', '8' => '-', '9' => '-' }
  end

  def display
    puts "| #{@board['1']} | #{@board['2']} | #{@board['3']} | "
    puts "| #{@board['4']} | #{@board['5']} | #{@board['6']} | "
    puts "| #{@board['7']} | #{@board['8']} | #{@board['9']} | "
  end
end
