# frozen_string_literal: true

module Battleship
  module Commands
    class DrawVertical
      def initialize(board, x, y1, y2, ship)
        @board = board
        @x = x
        @y1 = y1
        @y2 = y2
        @ship = ship
      end

      def call
        (y1..y2).each do |y|
          @board.set(x, y, ship)
        end

        @board
      end

      private

      attr_reader :x, :y1, :y2, :ship
    end
  end
end
