# frozen_string_literal: true

module Battleship
  class ShipType
    SHIPS = [
      Battleship::Ship.new(name: 'Carrier', size: 5, character: 'C'),
      Battleship::Ship.new(name: 'Battleship', size: 4, character: 'B'),
      Battleship::Ship.new(name: 'Destroyer', size: 3, character: 'D'),
      Battleship::Ship.new(name: 'Submarine', size: 3, character: 'S'),
      Battleship::Ship.new(name: 'Patrol Boat', size: 2, character: 'P')
    ].freeze

    def self.ships
      SHIPS
    end
  end
end
