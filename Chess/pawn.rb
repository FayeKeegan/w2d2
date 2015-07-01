require_relative 'piece'

class Pawn < Piece

  attr_reader :valid_moves

  def initialize(color, pos, moved, board)
  super
  end

  def diags(forward_pos)
    if self.color == :white
      diags_arr = [[forward_pos[0],forward_pos[1]-1], [forward_pos[0],forward_pos[1]+1]]
    else
      diags_arr = [[forward_pos[0],forward_pos[1]-1], [forward_pos[0],forward_pos[1]+1]]
    end
    diags_arr
  end

  def forward_one
    if self.color == :white
      forward_pos = [pos[0]-1, pos[1]]
    else
      forward_pos = [pos[0]+1, pos[1]]
    end
    forward_pos
  end

  def forward_two
    if self.color == :white
      other_color = :black
      forward_twice = [pos[0]-2, pos[1]]
    else
      other_color = :white
      forward_twice = [pos[0]+2, pos[1]]
    end
    forward_twice
  end

  def valid_moves
    valid_move_arr = []
    forward_pos = forward_one
    valid_move_arr << forward_pos if board[*forward_pos].empty?
    diags(forward_pos).each do |diag|
      if  board[*diag].piece? && board[*diag].color == other_color
        valid_move_arr << diag
      end
    end
    if !moved
      valid_move_arr << forward_two if board[*forward_pos].empty?
    end
    valid_move_arr
  end

  def to_s
    self.color != :white ? " \u{2659} " : " \u{265F} "
  end


end
