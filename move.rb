# frozen_string_literal: true

# How a knight can move around in a chess board
module Move
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
    list = Hash.new { |hash, key| hash[key] = [] }

    8.times do |row|
      8.times do |column|
        add_adjacent_squares(row, column, list)
      end
    end

    list
  end

  private

  def valid_square?(square)
    square.all? { |coordinate| coordinate.between? 0, 7 }
  end

  def add_adjacent_squares(row, column, list)
    TRAVEL_DISTANCES.each do |vertical, horizontal|
      adjacent_square = [row + vertical, column + horizontal]

      list[[row, column]] << adjacent_square if valid_square? adjacent_square
    end
  end
end
