# frozen_string_literal: true

module Battleship
  module Commands
    class Populate
      def initialize(board:, ships:)
        @board = board
        @ships = ships
      end

      def call
        @ships.each { |ship| populate(ship) }
      end

      private

      def populate(ship)
        loop do
          axis, start_position, end_position, direction = setup_position(ship)

          if populate?(axis, start_position, end_position, direction)
            command(direction).new(@board, axis, start_position, end_position, ship).call
            break
          end
        end
      end

      def setup_position(ship)
        ship_position = ShipPosition.new(ship)

        [
          ship_position.axis,
          ship_position.start_position,
          ship_position.end_position,
          ship_position.direction
        ]
      end

      def populate?(axis, start_position, end_position, direction)
        (start_position..end_position).all? do |position|
          can_populate?(direction, position, axis)
        end
      end

      def can_populate?(direction, x, y)
        if direction.horizontal?
          @board.get(x, y).water?
        else
          @board.get(y, x).water?
        end
      end

      def command(direction)
        if direction.horizontal?
          Battleship::Commands::DrawHorizontal
        else
          Battleship::Commands::DrawVertical
        end
      end
    end
  end
end
