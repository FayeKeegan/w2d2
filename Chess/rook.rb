require_relative 'sliding_piece'

ROOK_DIFFS = [[1,0],
              [0,1],
              [-1,0],
              [0,-1]]

class Rook < SlidingPiece
  def initialize(color, pos, moved, board)
    super(color, pos, moved, board, ROOK_DIFFS)
  end

  def to_s
    self.color != :white ? " \u{2656} " : " \u{265C} "
  end

end
