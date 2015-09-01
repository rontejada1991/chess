class Player
  attr_accessor :color, :start_row, :start_col, :end_row, :end_col

  def initialize color
    @color = color
    @start_row = nil
    @start_col = nil
    @end_row = nil
    @end_col = nil
  end

  def set_input
    print "#{@color} player: "
    input = gets.chomp
    @start_row = input[0].to_i
    @start_col = input[1].to_i
    @end_row = input[2].to_i
    @end_col = input[3].to_i
  end
end