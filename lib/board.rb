class Board
  attr_reader :board

  def initialize()
    @board = Array.new(3) { Array.new(3) }
  end

  def set_position(x, y, token)
    @board[x][y] = token
  end

  def position_empty?(x, y)
    @board[x][y].nil?
  end
end
