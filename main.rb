require './lib/chess_board.rb'
require './lib/knight.rb'



knight = Knight.new
knight.knight_moves([3,3],[4,3])
knight.knight_moves([0,0],[1,2])
knight.knight_moves([0,0],[3,3])
knight.knight_moves([3,3],[0,0])
