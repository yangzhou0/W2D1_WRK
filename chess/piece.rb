class Piece
  def initialize(pos, board)
    @atr = 'P'
    @pos = pos
    @board = board
  end

  def inspect
    @atr.inspect
  end

  def move

  end

end

class NullPiece < Piece
  def initialize
    @atr = nil
  end

  def inspect
    '_'
  end
end

module Slideable

end


module Stepable
end
