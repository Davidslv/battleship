module Battleship
  module Commands
    RSpec.describe DrawHorizontal do
      let(:board) { Battleship::Board.new }
      let(:subject) { described_class.new(board, 1, 0, 2, 'A') }

      context 'within boundaries' do
        it 'adds a ship horizontally in the given coordinates' do
          expected_board = [
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[A A A ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
          ]

          subject.perform
          assert_equal_board(board, expected_board)
        end
      end
    end
  end
end
