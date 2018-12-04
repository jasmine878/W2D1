require 'colorize'

class Piece

    def initialize(color)
        @color = color # :black, :white
    end
    
    def to_s
        "P".colorize(:red) if @color == :white
        "P".colorize(:blue) if @color == :black

        #Ruby knows to call the to_s method when we want to print the specific class
        #we need to write code to print.
        #in chess we want to display or print pieces on the board
    end

    def inspect
    end

end