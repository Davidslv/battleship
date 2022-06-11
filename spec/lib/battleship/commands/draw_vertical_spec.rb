module Battleship
  module Commands
    RSpec.describe DrawVertical do
      let(:board) { Battleship::Board.new }

      context 'when within board boundaries' do
        let(:subject) { described_class.new(board, 1, 0, 2, 'A') }

        it 'adds a ship vertically in the given coordinates' do
          expected_board =[
            %w[~ A ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ A ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ A ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
            %w[~ ~ ~ ~ ~ ~ ~ ~ ~ ~],
          ]

          subject.call
          assert_equal_board(board, expected_board)
        end
      end
    end
  end
end
