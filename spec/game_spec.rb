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
    context 'returns player\'s name number 1' do
      let(:game) { Game.new }
      it 'returns Player 1' do
        expect(game.get_player_name(0)).to eq 'Player 1'
      end
    end
    context 'returns player\'s name number 2' do
      let(:game) { Game.new }
      it 'returns Player 1' do
        expect(game.get_player_name(0)).to eq 'Player 2'
      end
    end
  end
end
