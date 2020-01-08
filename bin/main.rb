#!/usr/bin/env ruby
# frozen_string_literal: true

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
winner = false

players = {
  0 => { name: nil, token: 'x' },
  1 => { name: nil, token: 'o' }
}

board = Array.new(3) { Array.new(3) }

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

def display_who_starting(current_name, wait = 2)
  puts ' Choosing randomdly who is going to start the game! :) '.center(80, '=')
  puts "\n\n"
  puts "Great #{current_name}!! You're starting first and you're (x))! :)".center(80)

  puts "\nWait a moment to start the game!...".center(80)
  sleep(wait)
  puts `clear`
end

def display_board(board = Array)
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

def check_winner
  n = rand(0..1)
  booleans = [true, false, -1]
  booleans[n]
end

display_header

loop do
  ask_names(players)

  current_player = rand(0..1)
  current_name = players[current_player][:name]

  display_who_starting(current_name)

  # TODO: Starting new Game
  # ttt = Game.new()

  loop do
    puts `clear`
    display_board(board)

    break if winner == true

    loop do
      print "\n=> #{current_name} type the position's number': "
      position = gets.chomp.to_i

      unless position.between?(1, 9)
        puts "Upss! => #{current_name} wrong number! Type a number from 1-9."
        next
      end

      xy_pos = POSITIONS[position]

      if xy_pos.nil?
        puts "Upss! => #{current_name} wrong input :(! Type a number from 1-9."
        next
      end

      x, y = xy_pos

      if board[x][y].nil?
        board[x][y] = players[current_player][:token]
        break
      else
        puts 'Sorry that position was played!'
      end
    end

    current_player = 1 if current_player.zero?
    current_name = players[current_player][:name]
    winner = check_winner
  end

  next unless [true, -1].include? winner

  # If it's tie
  msg = winner == -1 ? 'Sorry Guys is a tie' : "Congratulations (#{current_name})! You win!"
  winner = false
  print "\n\n"
  print msg.center(80)
  puts "\nTo restart press (r)"
  puts 'To quit press (q)!'
  cmd = gets.chomp.strip.downcase

  case cmd
  when 'q'
    break
  when 'r'
    board = Array.new(3) { Array.new(3) }
  end
end

puts 'Thanks for playing, bye!! :)'
