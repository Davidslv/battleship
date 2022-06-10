# frozen_string_literal: true

module Battleship
  class Missile < Unit
    def initialize(character:, name: 'Missile', size: 0, reveal: true)
      super(name: name, size: size, character: character, reveal: reveal)
    end
  end
end
