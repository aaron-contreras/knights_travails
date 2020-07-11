# frozen_string_literal: true

require_relative './knight.rb'
require 'pry'

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
    binding.pry
    adjacency_list
  end

  def knight_moves(start, target)
    adjacency_list = build_adjacency_list
    queue = []
    visited = []
    queue << start
    loop do
      current_square = queue.shift
      visited << current_square
      break if current_square == target

      adjacency_list[current_square].each do |adjacent_square|
        queue << adjacent_square
      end
    end

    order_of_moves = [target]

    loop do
      move = visited.find do |square|
        adjacency_list[square].include? order_of_moves.last
      end
      order_of_moves << move
      break if order_of_moves.include? start
    end

    order_of_moves.reverse
  end
end
