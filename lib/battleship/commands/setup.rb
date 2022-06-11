# frozen_string_literal: true

module Battleship
  module Commands
    class Setup
      class << self
        def init(reveal: false)
          Battleship::Commands::Populate.new(
            board: Battleship::Board.new,
            ships: Battleship::ShipType.ships(reveal: reveal)
          ).call
        end
      end
    end
  end
end
