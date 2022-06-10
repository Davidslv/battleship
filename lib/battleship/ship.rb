# frozen_string_literal: true

module Battleship
  class Ship
    attr_reader :name, :size

    def initialize(name:, size:, character:)
      @name = name
      @size = size
      @character = character
      @hitpoints = size
    end

    def to_s
      @character
    end

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
