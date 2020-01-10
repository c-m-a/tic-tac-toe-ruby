# frozen_string_literal: true

require_relative './board'

class Game
  attr_accessor :board, :players
  attr_reader :status, :left_moves

  def initialize
    @status = false
    @left_moves = 9
    @board = Board.new
    @players = {
      0 => { name: nil, token: 'x' },
      1 => { name: nil, token: 'o' }
    }
  end

  def over?
    @left_moves -= 1

    check_rows
    check_columns
    check_diagonals

    @left_moves.zero? ? true : @status
  end

  def get_player_name(player_id)
    @players[player_id][:name]
  end

  def get_player_token(player_id)
    @players[player_id][:token]
  end

  def show_board
    @board.board
  end

  def play_position(x_pos, y_pos, current_player)
    token = @players[current_player][:token]
    if @board.position_empty?(x_pos, y_pos)
      @board.set_position(x_pos, y_pos, token)
      return true
    end
    false
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
    check_winner(@board.board)
  end

  def check_columns
    check_winner(@board.board.transpose)
  end

  def check_diagonals
    @players.each do |player|
      t = player[1][:token]
      @status = true if t == @board.board[0][0] && t == @board.board[1][1] && t == @board.board[2][2]
      @status = true if t == @board.board[0][2] && t == @board.board[1][1] && t == @board.board[2][0]
    end
  end
end
