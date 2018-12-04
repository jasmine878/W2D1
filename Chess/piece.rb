require 'colorize'

class Piece

    def initialize(color)
        @color = color # :black, :white
        @highlighted = false
    end
    
    def highlight
        @highlighted = true
    end

    def unhighlight
        @highlighted = false
    end

    def to_s
        if highlighted
            "P".colorize(:color => @color, :background => :yellow).underline
        else
            "P".colorize(:color => @color).underline
        end

        #Ruby knows to call the to_s method when we want to print the specific class
        #we need to write code to print.
        #in chess we want to display or print pieces on the board
    end

    private

    attr_reader :highlighted

end