# frozen_string_literal: true

require_relative './move.rb'
# Represents a knight chess piece
class Knight
  include Move

  attr_reader :queue, :visited, :adjacency_list
  def initialize
    @queue = []
    @visited = []
    @adjacency_list = build_adjacency_list
  end

  def travel_to_square(target)
    loop do
      current_square = queue.shift
      visited << current_square
      break if current_square == target

      adjacency_list[current_square].each do |adjacent_square|
        queue << adjacent_square
      end
    end
  end
end
