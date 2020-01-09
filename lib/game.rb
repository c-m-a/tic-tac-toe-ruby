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
    # Check board
    @status
  end
end
