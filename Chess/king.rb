require_relative 'stepping_piece'
require_relative 'piece'

KING_DIFFS = [[-1,-1],
              [-1,1],
              [1,-1],
              [1,1],
              [1,0],
              [-1,0],
              [0,1],
              [0,-1]]

class King < SteppingPiece
  def initialize(color, pos, moved, board)
    super(color, pos, moved, board, KING_DIFFS)
  end

  def to_s
    self.color != :white ? " \u{2654} " : " \u{265A} "
  end

end
