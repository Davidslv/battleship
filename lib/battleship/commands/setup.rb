# frozen_string_literal: true

module Battleship
  module Commands
    class Setup
      class << self
        def init
          board = Battleship::Board.new

          Battleship::Commands::Populate.new(
            board: board,
            ships: Battleship::ShipType.ships
          ).perform

          Battleship::Draw.board(board)

          board
        end
      end
    end
  end
end
