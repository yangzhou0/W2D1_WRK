require 'colorize'
require_relative "cursor.rb"
require_relative "board.rb"

class Display
  attr_reader :cursor, :board

  def initialize(board)
    @board = board
    @current_pos = [0,0]
    @cursor = Cursor.new(@current_pos, @board)
  end

  def render
    @board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if [i,j] == @cursor.cursor_pos
          print piece.inspect.colorize(:red)
        else
          print piece.inspect.colorize(:blue)
        end
        print ' '
      end
      print "\n"
    end
  end

  def render_loop
    5.times do
      self.render
      self.cursor.get_input
      system("clear")
    end
  end

end

b = Board.new
d = Display.new(b)
d.render_loop


#
#
# if __FILE__ == $PROGRAM_NAME do
#   # pseudocode
#   while true
#     display.render
#   end
# end
