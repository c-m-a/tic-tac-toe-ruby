# frozen_string_literal: true

require 'board'

RSpec.describe Board do
  describe '#initialize' do
    context 'Create Board Object' do
      let(:grid) { Board.new }
      it 'Returns nil 3x3 Array' do
        expect(grid.board).to eq Array.new(3) { Array.new(3) }
      end
    end
  end

  describe '#set_position' do
    context 'Set token position' do
      let(:grid) { Board.new }
      it 'Returns token from position set' do
        grid.set_position(0, 0, 'x')
        expect(grid.board[0][0]).to eq 'x'
      end
    end
  end

  describe '#position_empty?' do
    context 'Check all positions equal to nil' do
      let(:grid) { Board.new }
      it 'Returns Boolean' do
        3.times do |i|
          3.times do |j|
            expect(grid.position_empty?(i, j)).to eq true
          end
        end
      end
    end
    context 'Check position not nil' do
      let(:grid) { Board.new }
      it 'Returns Boolean' do
        3.times do |i|
          3.times do |j|
            grid.set_position(i, j, 'x')
            expect(grid.position_empty?(i, j)).to eq false
          end
        end
      end
    end
  end
end
