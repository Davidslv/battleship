# frozen_string_literal: true

module Battleship
  module Commands
    class Fire
      HIT_CHARACTER = 'X'
      MISS_CHARACTER = 'O'

      def initialize(board, x, y)
        @board = board
        @x = x
        @y = y
      end

      def call
        return { valid: false } unless position
        return { valid: false } unless set_fire_position

        {
          valid: true,
          water: position.water?,
          hit: position.hit?,
          sunk: position.sunk?,
          name: position.name
        }
      end

      private

      def position
        @position ||= @board.get(@x, @y)
      end

      def set_fire_position
        character = position.hit? ? HIT_CHARACTER : MISS_CHARACTER
        position.hit! if position.hit?

        fire = Battleship::Missile.new(character: character)

        @board.set(@x, @y, fire)
      end
    end
  end
end
