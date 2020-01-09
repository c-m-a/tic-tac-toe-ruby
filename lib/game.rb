# frozen_string_literal: true

class Game
  attr_accessor :board, :players, :status

  def initialize
    @status = false
    @board = Array.new(3) { Array.new(3) }
    @players = {
      0 => { name: nil, token: 'x' },
      1 => { name: nil, token: 'o' }
    }
  end

  def over?
    check_rows
    check_columns
    check_diagonals
    @status
  end

  private

  def check_winner(board)
    t0 = @players[0][:token]
    t1 = @players[1][:token]

    board.each do |x, y, z|
      @status = true if t0 == x && t0 == y && t0 == z
      @status = true if t1 == x && t1 == y && t1 == z
    end
  end

  def check_rows
    check_winner(@board)
  end

  def check_columns
    check_winner(@board.transpose)
  end

  def check_diagonals
    @players.each do |player|
      t = player[1][:token]
      @status = true if t == @board[0][0] && t == @board[1][1] && t == @board[2][2]
      @status = true if t == @board[0][2] && t == @board[1][1] && t == @board[2][0]
    end
  end
end
