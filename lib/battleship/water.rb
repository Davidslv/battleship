module Battleship
  class Water < Unit
    attr_reader :name, :size

    def initialize(name: 'Water', size: 0, character: '~')
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
