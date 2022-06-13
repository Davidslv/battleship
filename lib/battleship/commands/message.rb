# frozen_string_literal: true

module Battleship
  module Commands
    class Message
      def self.display(text)
        puts text
        puts "-------------------------------\n\n"
      end
    end
  end
end
