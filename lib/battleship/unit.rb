# frozen_string_literal: true

module Battleship
  class Unit
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
      false
    end

    def hit!
      hit?
    end

    def sunk?
      false
    end
  end
end
