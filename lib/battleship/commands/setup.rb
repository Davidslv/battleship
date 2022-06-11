# frozen_string_literal: true

module Battleship
  module Commands
    class Setup
      class << self
        def init(reveal: false)
          board = Battleship::Board.new

          Battleship::Commands::Populate.new(
            board: board,
            ships: Battleship::ShipType.ships(reveal: reveal)
          ).call

          Battleship::Draw.board(board)

          board
        end
      end
    end
  end
end
