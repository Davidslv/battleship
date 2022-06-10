# frozen_string_literal: true

module Battleship
  class Setup
    class << self
      def init
        board = Battleship::Board.new
        ships = Battleship::ShipType.ships

        Battleship::Draw.map(board, ships)

        board
      end
    end
  end
end
