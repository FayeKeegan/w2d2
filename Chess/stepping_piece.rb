require_relative 'piece'

class SteppingPiece < Piece

  def initialize(color, pos, moved, board, diffs)
    super(color, pos, moved, board)
    @diffs = diffs
  end

  def moves
    moves = []
    @diffs.each do |diff|
      moves << [pos[0]+diff[0],pos[1]+diff[1]]
    end
    moves
  end

end
