# frozen_string_literal: true

module Battleship
  module Commands
    class DrawHorizontal
      def initialize(board, x1, x2, y, ship)
        @board = board
        @x1 = x1
        @x2 = x2
        @y = y
        @ship = ship
      end

      def perform
        # TODO: validate boundaries
        # Reject when outside of the board

        (x1..x2).each do |x|
          @board.set(x, y, ship)
        end

        @board
      end

      private

      attr_reader :x1, :x2, :y, :ship
    end
  end
end
