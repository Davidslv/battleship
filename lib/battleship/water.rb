# frozen_string_literal: true

module Battleship
  class Water < Unit
    def initialize(name: 'Water', size: 0, character: '~')
      super(name: name, size: size, character: character)
    end

    def water?
      true
    end
  end
end
