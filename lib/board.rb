class Board
  def initialize()
    @board = Array.new(3) { Array.new(3) }
  end

  def get_board
    @board
  end

  def set_position(x, y, token)
    @board[x][y] = token
  end

  def get_board
    @board
  end

  def position_empty?(x, y)
    @board[x][y].nil?
  end
end
