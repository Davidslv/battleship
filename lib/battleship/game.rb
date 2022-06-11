# frozen_string_literal: true

module Battleship
  class Message
    def self.display(text)
      puts text
      puts "-------------------------------\n\n"
    end
  end

  class Game
    def initialize
      system('clear')
      Message.display("Enjoy your Game, CTRL+C to quit")

      @ships = Battleship::ShipType.ships
      @missiles = @ships.map(&:size).sum * 3

      @board = Battleship::Commands::Populate.new(
        board: Battleship::Board.new,
        ships: @ships
      ).call
    end

    def run
      puts @board

      while !@ships.all?(&:sunk?) do
        process_input
        update
        render
      end
    end

    private

    def process_input
      Message.display("\n\nMissiles left: #{@missiles}") if @missiles < 34
      print "\nProvide coordinates: "
      @x, @y = gets.chomp.split(' ').map(&:to_i)
    end

    def update
      system('clear')

      fire = Battleship::Commands::Fire.new(@board, @x, @y).call
      @missiles -= 1

      if @missiles.zero? && @ships.all?(&:sunk?)
        Message.display("Phew... You have have won the game.")
        exit
      end

      if @missiles.zero? && !@ships.all?(&:sunk?)
        Message.display("You have have lost the game.")
        exit
      end

      if @ships.all?(&:sunk?)
        Message.display("You have have won the game.")
        exit
      elsif fire[:water]
        Message.display("You have missed.")
      elsif fire[:sunk]
        Message.display("You have sunk a #{fire[:name]}.")
      elsif fire[:hit]
        Message.display("You have hit a #{fire[:name]}.")
      else
        Message.display("Unknown...")
      end
    end

    def render
      puts @board
    end
  end
end
