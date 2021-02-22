#file for board logic

class Board
  @@board = { 1 => '-', 2 => '-', 3 => '-',
            4 => '-', 5 => '-', 6 => '-',
            7 => '-', 8 => '-', 9 => '-' }
  
  def display_board
    @@board
  end
end
