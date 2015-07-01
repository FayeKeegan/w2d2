require 'byebug'
class Piece
  attr_accessor :color, :pos, :board, :moved

  def initialize(color, pos, moved=false, board)
    @color, @pos, @moved, @board = color, pos, moved, board
  end

  def empty?
    false
  end

  def piece?
    true
  end

  def to_s
    " X ".colorize(@color)
  end

  def move_to(pos)
    self.pos = pos
    self.moved = true
  end

  def moves
    full_board = []
    board.size.times do |i|
      board.size.times do |j|
        full_board << [i, j]
      end
    end
    full_board.delete(pos)
    full_board
  end

  def other_color
    self.color == :white ? :black : :white
  end

  def valid_moves
    self.moves.select do |pos|
      debugger
      board.on_board?(pos) && (board[*pos].empty? || board[*pos].color == other_color)
    end
  end
end
