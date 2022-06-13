# frozen_string_literal: true

module Battleship
  class Game
    def initialize
      system('clear')
      Battleship::Commands::Message.display('Enjoy your Game, CTRL+C to quit.')

      @ships = Battleship::ShipType.ships(reveal: true)
      @missiles = @ships.map(&:size).sum * 3

      @board = Battleship::Commands::Populate.new(
        board: Battleship::Board.new,
        ships: @ships
      ).call
    end

    def run
      render

      until win? || lost?
        display_remaining_missiles
        process_input
        update
        render
      end
    end

    private

    def win?
      !@missiles.zero? && @ships.all?(&:sunk?)
    end

    def lost?
      @missiles.zero? && !@ships.all?(&:sunk?)
    end

    def process_input
      @x, @y = nil

      while (@x.nil? && @y.nil?) || (@x.nil? || @y.nil?)
        print "\nProvide coordinates: "
        @x, @y = gets.chomp.split.map(&:to_i)
      end
    end

    def update
      system('clear')

      @fire = Battleship::Commands::Fire.new(@board, @x, @y).call
      @missiles -= 1

      display_message
    end

    def render
      puts @board
    end

    def display_remaining_missiles
      Battleship::Commands::Message.display("\n\nMissiles left: #{@missiles}")
    end

    def display_message
      return end_game_display_message if win?
      return lost_display_message if lost?

      firing_display_messages
    end

    def firing_display_messages
      if @fire[:water]
        Battleship::Commands::Message.display('You have missed.')
      elsif @fire[:sunk]
        Battleship::Commands::Message.display("You have sunk a #{@fire[:name]}.")
      elsif @fire[:hit]
        Battleship::Commands::Message.display("You have hit a #{@fire[:name]}.")
      else
        Battleship::Commands::Message.display('Unknown...')
      end
    end

    def end_game_display_message
      Battleship::Commands::Message.display('You have have won the game.')
    end

    def lost_display_message
      Battleship::Commands::Message.display('You have have lost the game.')
    end
  end
end
