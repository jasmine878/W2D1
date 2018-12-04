require_relative 'piece'
require_relative 'null_piece'

class Board

    attr_reader :board

    def board
        @board
    end
    
    def initialize
        populate_board
    end

    def populate_board
        @board = Array.new(8)

        populate_pieces([0,1], :white)
        populate_pieces((2..5), :null)
        populate_pieces([6,7], :black)
    end

    def populate_pieces(rows, piece_type)
        rows.each do |index|
            #iterating through each row [0, 1]
            unless piece_type == :null
                @board[index] = Array.new(8, Piece.new(piece_type))
                # here we create columns in each row
                # Piece.new is what we place in each cell
            else
                @board[index] = Array.new(8, NullPiece.new) 
            end
        end
    end

    def [](pos)                 #bracket method called on the Board Class
        row, col = pos
        @board[row][col]        #bracket method called on an Array @board
        # x is the row, y is the column
        # pos is the position
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val
    end

    def inspect
        "Board has been created. "
        #all methods have default initialize, inspect, and to_s mmethods
        #default inspect method just returns our instance of a class object
        #ie) "#<Board:0x00007fe36a1d1ff0>"
    end

    def display
        @board.each do |row|
            # 1st row = [Piece, Piece, Piece, ...]
            # row.join "Piece.to_s  Piece.to_s  Piece.to_s ..."
            # row.join "P  P  P  P ..."
            puts row.join("  ")
        end
        nil
    end

    def move_piece(start_pos, end_pos)
        raise NoPieceAtStartError if self[start_pos].is_a?(NullPiece)
        raise OccupiedPositionError unless self[end_pos].is_a?(NullPiece)
        #checks to see if the piece in the position is a Null Piece
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
        # start has piece, end doesnt, and we switch status
    end

end