# frozen_string_literal: true

require_relative './knight.rb'

# Represents a chess 8x8 game board
class GameBoard
  attr_reader :knight

  def initialize
    @knight = Knight.new
  end

  def knight_moves(start, target)
    knight.queue << start
    knight.travel_to_square target
    knights_path = path start, target
    show_path knights_path
  end

  private

  def path(start, target)
    order_of_moves = [target]

    loop do
      move = knight.visited.find do |square|
        knight.adjacency_list[square].include? order_of_moves.last
      end

      order_of_moves << move

      return order_of_moves.reverse if order_of_moves.include? start
    end
  end

  def show_path(knights_path)
    number_of_moves = knights_path.length - 1

    puts "You made it in #{number_of_moves} moves! Here's your path: "

    knights_path.each do |move|
      p move
    end
  end
end
