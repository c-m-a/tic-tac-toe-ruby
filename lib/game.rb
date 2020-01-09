# frozen_string_literal: true

class Game
  attr_accessor :board, :players, :status

  def initialize
    @status = false
    @board = board = Array.new(3) { Array.new(3) }
    @players = {
      0 => { name: nil, token: 'x' },
      1 => { name: nil, token: 'o' }
    }
  end

  def over?
    check_rows
    check_columns
    @status
  end

  private
  def check_winner(board)
    t0 = @players[0][:token]
    t1 = @players[1][:token]

    board.each do |x, y, z|
      if t0 == x && t0 == y && t0 == z
        @status = true
        break
      end

      if t1 == x && t1 == y && t1 == z
        @status = true
        break
      end
    end
  end

  def check_rows
    check_winner(@board)
  end

  def check_columns
    check_winner(@board.transpose)
  end

  def check_diagonals
  end
end
