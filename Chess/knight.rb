require_relative 'stepping_piece'
require_relative 'piece'

KNIGHT_DIFFS = [ [-2, -1],
          [-2,  1],
          [2,   1],
          [2,  -1],
          [1,   2],
          [1,  -2],
          [-1, -2],
          [-1,  2]]

class Knight < SteppingPiece
  def initialize(color, pos, moved, board)
    super(color, pos, moved, board, KNIGHT_DIFFS)
  end

  def to_s
    self.color != :white ? " \u{2658} " : " \u{265E} "
  end

end
