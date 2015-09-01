require_relative 'chess_game/game_board'
require_relative 'chess_game/player'

game_board = GameBoard.new
white_player = Player.new "white"
black_player = Player.new "black"
current_player = white_player

while true
  game_board.display
  current_player.set_input
  game_board.update current_player.start_row, current_player.start_col, current_player.end_row, current_player.end_col
  current_player = current_player == white_player ? 
    black_player : white_player
end