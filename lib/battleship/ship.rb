# frozen_string_literal: true

module Battleship
  class Ship < Unit
    def hit?
      true
    end

    def hit!
      @hitpoints -= 1

      hit?
    end

    def sunk?
      @hitpoints <= 0
    end
  end
end
