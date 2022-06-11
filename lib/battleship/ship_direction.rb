# frozen_string_literal: true

module Battleship
  class ShipDirection
    def initialize
      @direction = rand > 0.5 ? :vertical : :horizontal
    end

    def vertical?
      @direction == :vertical
    end

    def horizontal?
      @direction == :horizontal
    end
  end
end
