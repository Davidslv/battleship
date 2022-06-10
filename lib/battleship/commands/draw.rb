# frozen_string_literal: true

module Battleship
  class Draw
    def self.map(board, ships)
      system('clear')

      ships.each do |ship|
        command = rand > 0.5 ? :vertical : :horizontal

        if command == :vertical
          x = rand(0...Battleship::Board::BOARD_SIZE)
          y1 = rand(0...Battleship::Board::BOARD_SIZE - ship.size)
          y2 = y1 + ship.size - 1

          Battleship::Commands::DrawVertical.new(board, x, y1, y2, ship).perform
        else
          x1 = rand(0...Battleship::Board::BOARD_SIZE - ship.size)
          x2 = x1 + ship.size - 1
          y = rand(0...Battleship::Board::BOARD_SIZE)

          Battleship::Commands::DrawHorizontal.new(board, x1, x2, y, ship).perform
        end
      end

      puts board
    end
  end
end
