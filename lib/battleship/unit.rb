# frozen_string_literal: true

module Battleship
  class Unit
    attr_reader :name, :size

    def initialize(name:, size:, character:, reveal: false)
      @name = name
      @size = size
      @character = character
      @hitpoints = size
      @reveal = reveal
    end

    def to_s
      @reveal ? @character : '~'
    end

    def hit?
      false
    end

    def water?
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
