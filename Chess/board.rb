require_relative 'piece'
require_relative 'null_piece'

class Board
    
    def initialize
        create_and_populate_board
    end

    def create_and_populate_board
        @board = Array.new(8)
        piece_rows = [0, 1, 6, 7]
        @board.each_index do |row_index|
            if piece_rows.include?(row_index)
                @board[row_index] = Array.new(8, Piece.new)
                #populates first 2 and last 2 columns with pieces
            else 
                @board[row_index] = Array.new(8, NullPiece.new)
                #rest of the board is kept empty or nil
            end
        end
    end

    def [](pos)
        row, col = pos
        @board[row][col]
        # x is the row, y is the column
        # pos is the position
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end

    def inspect
        "hello"
    end

    def move_piece(start_pos, end_pos)
        raise NoPieceAtStartError if self[start_pos].is_a?(NullPiece)
        raise OccupiedPositionError unless self[end_pos].is_a?(NullPiece)
        #checks to see if the piece in the position is a Null Piece
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
        # start has piece, end doesnt, and we switch status
    end

end