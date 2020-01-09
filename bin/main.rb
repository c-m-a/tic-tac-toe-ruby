#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/game'

POSITIONS = {
  1 => [0, 0],
  2 => [0, 1],
  3 => [0, 2],
  4 => [1, 0],
  5 => [1, 1],
  6 => [1, 2],
  7 => [2, 0],
  8 => [2, 1],
  9 => [2, 2]
}.freeze

TITLE = ' Tic Tac Toe Game '

ttt = Game.new

def display_header
  puts `clear`
  puts ''.center(80, '=')
  puts TITLE.center(80, '=')
  print ''.center(80, '=') + "\n\n"
end

def ask_names(players = Array)
  2.times do |n|
    player_number = n + 1
    print "Type the name of the player #{player_number}: "
    name = gets.chomp
    name = 'Player ' + player_number.to_s if name.empty?
    players[n][:name] = name.capitalize
    print "Hi #{name.capitalize}! Welcome to the Game! :)\n\n"
  end
end

def display_who_starting(current_name, wait = 1)
  puts ' Choosing randomdly who is going to start the game! :) '.center(80, '=')
  puts "\n\n\n"
  puts "Great #{current_name}!! You're starting first and you're (x))! :)".center(80)

  puts "\nWait a moment to start the game!...".center(80)
  sleep(wait)
  puts `clear`
end

def display_board(board = Array)
  puts `clear`
  row = 1
  step = 0
  last_row = ' ------------------------- '.center(80)
  middle_row = ' |-----------------------| '.center(80)

  puts ''.center(80, '=')
  puts TITLE.center(80, '=')
  print ''.center(80, '=') + "\n\n"
  puts ' ------------------------- '.center(80)

  board.each do |x, y, z|
    x = x.nil? ? step + 1 : x
    y = y.nil? ? step + 2 : y
    z = z.nil? ? step + 3 : z
    puts " |   #{x}   |   #{y}   |   #{z}   | ".center(80)
    puts row != 3 ? middle_row : last_row
    row += 1
    step += 3
  end
end

def over?
  n = rand(0..1)
  booleans = [true, false, -1]
  booleans[n]
end

def ask_position(current_name)
  print "\n=> #{current_name} type the position's number': "
  gets.chomp.to_i
end

def quit_game(left_moves, current_name)
  # If it's tie
  msg = left_moves.zero? ? "Sorry Guys! It's a tie" : "Congratulations (#{current_name})! You win!"

  print "\n\n"
  print msg.center(80)
  puts "\n\nRestart the game? (y/n)"

  gets.chomp.strip.downcase == 'n'
end

def valid_position?(position, current_name)
  if !position.between?(1, 9) || POSITIONS[position].nil?
    puts "Upss! => #{current_name} wrong input :(! Type a number from 1-9."
    return false
  end

  true
end

display_header

loop do
  ask_names(ttt.players)

  current_player = rand(0..1)

  display_who_starting(ttt.get_player_name(current_player))

  loop do
    display_board(ttt.board)

    loop do
      position = ask_position(ttt.get_player_name(current_player))

      next unless valid_position?(position, ttt.get_player_name(current_player))

      x, y = POSITIONS[position]

      if ttt.board[x][y].nil?
        ttt.board[x][y] = ttt.get_player_token(current_player)
        display_board(ttt.board)
        break
      else
        puts 'Sorry that position was played!'
      end
    end

    break if ttt.over?

    current_player = current_player.zero? ? 1 : 0
  end

  next unless ttt.status

  break if quit_game(ttt.left_moves, ttt.get_player_name(current_player))

  ttt = Game.new
end

puts 'Thanks for playing, bye!! :)'
