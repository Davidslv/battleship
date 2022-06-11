# frozen_string_literal: true

module Battleship
  class ShipPosition
    def initialize(ship)
      @ship = ship
    end

    def axis
      @axis ||= rand(0...Battleship::Board::BOARD_SIZE)
    end

    def start_position
      @start_position ||= rand(0...Battleship::Board::BOARD_SIZE - @ship.size)
    end

    def end_position
      @end_position ||= (start_position + @ship.size - 1)
    end

    def direction
      @direction ||= ShipDirection.new
    end
  end
end
