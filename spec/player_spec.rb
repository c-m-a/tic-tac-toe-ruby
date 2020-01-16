# frozen_string_literal: true

require 'player'

RSpec.describe Player do
  describe '#initialize' do
    context 'Create Object with default values' do
      let(:player) { Player.new }
      it 'Return default args' do
        expect(player.name).to eq nil
        expect(player.token).to eq nil
      end
    end
    context 'Create Object with some values' do
      let(:player) { Player.new('Player 1', 'x') }
      it 'Return default args' do
        expect(player.name).to eq 'Player 1'
        expect(player.token).to eq 'x'
      end
    end
  end
end
