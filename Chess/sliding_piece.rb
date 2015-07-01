require_relative 'piece'


class SlidingPiece < Piece
  def initialize(color, pos, moved, board, diffs)
    super(color, pos, moved, board)
    @diffs = diffs
  end

  def moves
    moves = []
    @diffs.each do |diff|
      moves + next_move(pos, diff)
    end
    moves
  end

  def next_move(pos, diff)
    next_pos = [pos[0] + diff[0], pos[1] + diff[1]]
    return [] if board.off_board?(next_pos)
    if board[*next_pos].empty?
      return [next_pos] + next_move(next_pos, diff)
    end
    return next_pos if board[*next_pos].color == other_color
    return [] if board[*next_pos].color == self.color
  end



  end
