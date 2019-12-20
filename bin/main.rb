#!/usr/bin/env ruby

POSITIONS = {
  1 => [0,0],
  2 => [0,1],
  3 => [0,2],
  4 => [1,0],
  5 => [1,1],
  6 => [1,2],
  7 => [2,0],
  8 => [2,1],
  9 => [2,2]
}.freeze

board = Array.new(3) { Array.new(3) }

players = {
  0 => { name: nil, token: 'x' },
  1 => { name: nil, token: 'o'}
}

game_name = ' Tic Tac Toe Game '
last_row = " ------------------------- ".center(80)
middle_row = " |-----------------------| ".center(80)

puts `clear`
puts "".center(80, '=')
puts game_name.center(80, '=')
print "".center(80, '=') + "\n\n"

while 1
  2.times do |n|
    player_number = n + 1
    print "Type the name of the player #{player_number}: "
    name = gets.chomp
    name = "Player " + (player_number).to_s if name.empty?
    players[n][:name] = name.capitalize
    print "Hi #{name.capitalize}! Welcome to the Game! :)\n\n"
  end

  current_player = rand(0..1)
  current_name = players[current_player][:name]
  winner = false
  puts " Choosing randomdly who is going to start the game! :) ".center(80, '=')
  puts "\n\nGreat #{current_name}!! You're starting first and you're (x))! :)".center(80)

  puts "\nWait a moment to start the game!...".center(80)
  sleep(3)
  puts `clear`

  # TODO: Starting new Game
  # ttt = Game.new()

  while winner == false
    puts "".center(80, '=')
    puts game_name.center(80, '=')
    print "".center(80, '=') + "\n\n"
    row = 1
    step = 0
    puts " ------------------------- ".center(80)

    board.each do |x,y,z|
      x = x.nil? ? step + 1 : x
      y = y.nil? ? step + 2 : y
      z = z.nil? ? step + 3 : z
      puts " |   #{x}   |   #{y}   |   #{z}   | ".center(80)
      puts row != 3 ? middle_row : last_row
      row += 1
      step += 3
    end

    loop do
      print "\n#{current_name} type the position's number': "
      position = gets.chomp
      position = position.to_i

      if !position.between?(1,9)
        puts "Upss! #{current_name} wrong number! Type a number from 1-9"
        next
      end

      p position.class
      xy_pos = POSITIONS[position]

      if xy_pos.nil?
        puts "Upss! #{current_name} wrong input :(! Type a number from 1-9"
        next
      end

      x, y = xy_pos

      if board[x][y].nil?
        board[x][y] = players[current_player][:token]
        break
      end
    end

    current_player = current_player == 0 ? 1 : 0
    current_name = players[current_player][:name]
    puts `clear`
    winner = false
  end

  puts "\nTo restart press (Enter)"
  puts "To quit press (q)!"
  break if gets.chomp.strip.downcase == 'q'
end

puts 'Thanks for playing, bye!! :)'
