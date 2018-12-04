require 'colorize'

class Piece

    def initialize(color)
        @color = color # :black, :white
    end
    
    def to_s
        return "P".colorize(:color => :white ) if @color == :white
        "P".colorize(:color => :black ) if @color == :black

        #Ruby knows to call the to_s method when we want to print the specific class
        #we need to write code to print.
        #in chess we want to display or print pieces on the board
    end

    

end