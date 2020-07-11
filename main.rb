# frozen_string_literal: true

require_relative 'game_board.rb'

game_board = GameBoard.new
game_board.knight_moves([3, 3], [4, 3])
