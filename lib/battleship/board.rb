# frozen_string_literal: true

module Battleship
  class Board
    BOARD_SIZE = 10
    DEFAULT_VALUE = '~'

    def initialize
      @board = Array.new(BOARD_SIZE) do
        Array.new(BOARD_SIZE) { DEFAULT_VALUE }
      end
    end

    def get(x, y)
      return false unless valid?(x, y)

      @board[y][x]
    end

    def set(x, y, item)
      return false unless valid?(x, y)

      @board[y][x] = item
      true
    end

    def to_s
      header = (0...10).to_a.prepend(' ').join(' ')

      body = @board.each_with_index.map do |row, index|
        [index, row].join(' ')
      end

      [header, body].join("\n")
    end

    private

    def valid?(x, y)
      validate_coordinate(x) && validate_coordinate(y)
    end

    def validate_coordinate(coordinate)
      coordinate.between?(0, BOARD_SIZE - 1)
    end
  end
end
