require_relative 'board'
require_relative 'cursor'

class Display

    attr_reader :cursor
    #don't want this attr_reader private, because it needs to interact with the other classes

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        system('clear')

        # @board[cursor.cursor_pos].colorize(:background => :yellow)
        @board.board.each do |row|
            # 1st row = [Piece, Piece, Piece, ...]
            # row.join "Piece.to_s  Piece.to_s  Piece.to_s ..."
            # row.join "P  P  P  P ..."
            puts row.join("|")
        end
        nil
    end


end

