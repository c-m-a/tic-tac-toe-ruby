# frozen_string_literal: true

class Board
  attr_reader :board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def set_position(x_pos, y_pos, token)
    @board[x_pos][y_pos] = token
  end

  def position_empty?(x_pos, y_pos)
    @board[x_pos][y_pos].nil?
  end
end
