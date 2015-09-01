require_relative 'chess_piece'

class GameBoard
  attr_accessor :board

  def initialize
    @board = []
    create
    populate
  end

  # Creates an empty game board
  def create
    (0..7).each do |row|
      @board << []
      (0..7).each do |col| 
        @board[row] << "[  ]"
      end
    end
  end

  # Populate the game board with chess pieces
  def populate
    @board[7][0] = ChessPiece.new "w_rook_1", "\u2656"
    @board[7][1] = ChessPiece.new "w_knight_1", "\u2658"
    @board[7][2] = ChessPiece.new "w_bishop_1", "\u2657"
    @board[7][3] = ChessPiece.new "w_queen", "\u2655"
    @board[7][4] = ChessPiece.new "w_king", "\u2654"
    @board[7][5] = ChessPiece.new "w_bishop_2", "\u2657"
    @board[7][6] = ChessPiece.new "w_knight_2", "\u2658"
    @board[7][7] = ChessPiece.new "w_rook_2", "\u2656"
    @board[0][0] = ChessPiece.new "b_rook_1", "\u265C"
    @board[0][1] = ChessPiece.new "b_knight_1", "\u265E"
    @board[0][2] = ChessPiece.new "b_bishop_1", "\u265D"
    @board[0][3] = ChessPiece.new "b_queen", "\u265B"
    @board[0][4] = ChessPiece.new "b_king", "\u265A"
    @board[0][5] = ChessPiece.new "b_bishop_2", "\u265D"
    @board[0][6] = ChessPiece.new "b_knight_2", "\u265E"
    @board[0][7] = ChessPiece.new "b_rook_2", "\u265C"
    (0..7).each do |id|
      @board[6][id] = ChessPiece.new "w_pawn_#{id+1}", "\u2659"
      @board[1][id] = ChessPiece.new "b_pawn_#{id+1}", "\u265F"
    end    
  end

  # Moves a piece on the board to another position
  def update start_row, start_col, end_row, end_col
    temp = @board[start_row][start_col]
    @board[start_row][start_col] = "[  ]"
    @board[end_row][end_col] = temp
  end

  # Formats and displays the game board
  def display
    puts "  0   1   2   3   4   5   6   7  "
    puts "#{format}"
  end

  # Returns a string that resembles a chess board
  def format
    display_string = ""
    (0..7).each do |row|
      display_string += "#{row}"
      (0..7).each do |col| 
        if @board[row][col].instance_of? ChessPiece
          display_string += "[#{@board[row][col].unicode} ]"
        elsif @board[row][col].is_a? String
          display_string += @board[row][col]
        end
      end
      display_string += "\n"
    end

    return display_string
  end
end