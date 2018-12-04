require_relative 'piece'

class NullPiece < Piece
    
    def initialize
        @highlighted = false
    end

    def to_s
        if highlighted
            "_".colorize(:background => :yellow).underline
        else
            "_"
        end
    end
    
end