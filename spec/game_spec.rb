# frozen_string_literal: true

require 'game'

RSpec.describe Game do
  describe '#initialize' do
    context 'Create new object' do
      let(:game) { Game.new }
      it 'returns Array' do
        expect(game.show_board).to be_kind_of Array
      end
    end
    context 'Returns nil 3x3 Array' do
      let(:game) { Game.new }
      it 'returns nil 3x3 Array' do
        expect(game.show_board).to eq Array.new(3) { Array.new(3) }
      end
    end
    context 'returns player\'s name number 1' do
      let(:game) { Game.new }
      it 'returns Player 1' do
        expect(game.get_player_name(0)).to eq 'Player 1'
      end
    end
    context 'returns player\'s name number 2' do
      let(:game) { Game.new }
      it 'returns Player 2' do
        expect(game.get_player_name(1)).to eq 'Player 2'
      end
    end
  end

  describe '#set_player_name' do
    context 'Set and get the player name # 1' do
      let(:game) { Game.new }
      it 'Returns player name # 1 set' do
        player_name = 'Test 1'
        player_id = 0
        game.set_player_name(player_id, player_name)
        expect(game.get_player_name(player_id)).to eq player_name
      end
    end
    context 'Set and get the player name # 2' do
      let(:game) { Game.new }
      it 'Returns player name # 2 set' do
        player_name = 'Test 2'
        player_id = 1
        game.set_player_name(player_id, player_name)
        expect(game.get_player_name(player_id)).to eq player_name
      end
    end
  end

  describe '#get_player_token' do
    context 'Check player token # 1' do
      let(:game) { Game.new }
      it 'Returns player token # 1' do
        expect(game.get_player_token(0)).to eq 'x'
      end
    end
    context 'Check player token # 2' do
      let(:game) { Game.new }
      it 'Returns player token # 2' do
        expect(game.get_player_token(1)).to eq 'o'
      end
    end
  end

  describe '#play_position' do
    context 'Check position set' do
      let(:game) { Game.new }
      it 'Returns an Array with position set' do
        test_arr = Array.new(3) { Array.new(3) }
        3.times do |i|
          3.times do |j|
            test_arr[i][j] = game.get_player_token(0)
            game.play_position(i, j, 0)
            expect(game.show_board).to eq test_arr
          end
        end
      end
    end
  end

  describe '#over?' do
    context 'Check winning row' do
      let(:game) { Game.new }
      it 'Returns a Boolean' do
        3.times do |i|
          game = Game.new
          3.times do |j|
            game.play_position(i, j, 0)
          end
          expect(game.over?).to eq true
        end
      end
    end

    context 'Check winning column' do
      let(:game) { Game.new }
      it 'Returns a Boolean' do
        3.times do |i|
          game = Game.new
          3.times do |j|
            game.play_position(j, i, 0)
          end
          expect(game.over?).to eq true
        end
      end
    end

    context 'Check winning first diagonal' do
      let(:game) { Game.new }
      it 'Returns a Boolean' do
        game.play_position(0, 0, 0)
        game.play_position(1, 1, 0)
        game.play_position(2, 2, 0)
        expect(game.over?).to eq true
      end
    end

    context 'Check winning second diagonal' do
      let(:game) { Game.new }
      it 'Returns a Boolean' do
        game.play_position(0, 2, 0)
        game.play_position(1, 1, 0)
        game.play_position(2, 0, 0)
        expect(game.over?).to eq true
      end
    end
  end
end
