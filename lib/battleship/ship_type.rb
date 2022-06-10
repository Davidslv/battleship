# frozen_string_literal: true

module Battleship
  class ShipType
    def self.ships(reveal: false)
      [
        Battleship::Ship.new(name: 'Carrier', size: 5, character: 'C', reveal: reveal),
        Battleship::Ship.new(name: 'Battleship', size: 4, character: 'B', reveal: reveal),
        Battleship::Ship.new(name: 'Destroyer', size: 3, character: 'D', reveal: reveal),
        Battleship::Ship.new(name: 'Submarine', size: 3, character: 'S', reveal: reveal),
        Battleship::Ship.new(name: 'Patrol Boat', size: 2, character: 'P', reveal: reveal)
      ]
    end
  end
end
