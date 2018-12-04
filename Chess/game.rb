require_relative 'board'
require_relative 'display'
# require_relative 'player'

class Game

    attr_reader :board


    def initialize(player_one_name)
        #we need to create new objects since we're not taking in arguments
        @board = Board.new
        @display = Display.new(board)
        # there is a new cursor object created inside the Display object
        # it has a public attr reader which I can use in the Game class below
    end

    def play

        while true
            @display.render
            @display.cursor.get_input
            
        end

    end



end