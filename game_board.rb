# frozen_string_literal: true

require_relative './knight.rb'
require_relative './move.rb'

# Represents a chess 8x8 game board
class GameBoard
  attr_accessor :board, :move_tree
  attr_reader :knight

  TRAVEL_DISTANCES = [
    [-2, -1],
    [-1, -2],
    [1, -2],
    [2, -1],
    [-1, 2],
    [-2, 1],
    [2, 1],
    [1, 2]
  ].freeze

  def build_adjacency_list
    adjacency_list = Hash.new { |hash, key| hash[key] = [] }
    8.times do |row|
      8.times do |column|
        TRAVEL_DISTANCES.each do |vertical, horizontal|
          adjacent_square = [row + vertical, column + horizontal]

          if adjacent_square.all? { |coordinate| coordinate.between? 0, 7 }
            adjacency_list[[row, column]] << adjacent_square
          end
        end
      end
    end
  end
end
