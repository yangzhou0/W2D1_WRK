require_relative 'piece'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) {nil} }
    self.set_board
  end

  def set_board
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos,val)
    x, y = pos
    @grid[x][y] = val
  end

  def is_on_board? (pos)
    self[pos].is_a? (Piece)
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    if !self.is_on_board?(start_pos) || piece.class == NullPiece
      raise StandardError
      # raise StandardError unless piece.can_move?(end_pos)
    end
    self[start_pos], self[end_pos] = NullPiece.new, piece
  end

end
