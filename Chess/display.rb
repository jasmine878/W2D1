require_relative 'board'
require_relative 'cursor'

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        # @board[cursor.cursor_pos].colorize(:background => :yellow)
        @board.board.each do |row|
            # 1st row = [Piece, Piece, Piece, ...]
            # row.join "Piece.to_s  Piece.to_s  Piece.to_s ..."
            # row.join "P  P  P  P ..."
            puts row.join("|")
        end
        nil
    end

    private

    attr_reader :cursor

end