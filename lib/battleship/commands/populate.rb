# frozen_string_literal: true

module Battleship
  module Commands
    class Populate
      def initialize(board:, ships:)
        @board = board
        @ships = ships
      end

      def perform
        @ships.each do |ship|
          populate(ship)
        end
      end

      private

      def direction
        rand > 0.5 ? :vertical : :horizontal
      end

      def horizontal?
        direction == :horizontal
      end

      # TODO: This method will need improvement in the future
      # 1 board takes an average of 6 cycles to build
      # rubocop:disable Metrics/MethodLength
      def populate(ship)
        loop do
          axis, start_position, end_position = define_position(ship)

          if horizontal?
            free_spaces = (start_position..end_position).map { |x| can_populate?(x, axis) }

            if free_spaces.all?(true)
              Battleship::Commands::DrawHorizontal.new(@board, start_position, end_position, axis, ship).perform
              break
            end
          else
            free_spaces = (start_position..end_position).map { |y| can_populate?(axis, y) }

            if free_spaces.all?(true)
              Battleship::Commands::DrawVertical.new(@board, axis, start_position, end_position, ship).perform
              break
            end
          end
        end
      end
      # rubocop:enable Metrics/MethodLength

      def define_position(ship)
        axis = rand(0...Battleship::Board::BOARD_SIZE)
        start_position = rand(0...Battleship::Board::BOARD_SIZE - ship.size)
        end_position = start_position + ship.size - 1

        [axis, start_position, end_position]
      end

      def can_populate?(x, y)
        @board.get(x, y).water?
      end
    end
  end
end
