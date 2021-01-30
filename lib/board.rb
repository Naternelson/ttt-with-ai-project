class Board
    attr_accessor :cells
    def initialize
        self.reset!
    end
    
    #Sets the board cells to empty values
    def reset!
        self.cells = []
        9.times {self.cells << " "}
    end

    #Displays the current setup of the board
    def display
        i = 0
        while i < 7
            puts  " #{self.cells[i]} | #{self.cells[i+1]} | #{self.cells[i+2]} "
            i += 3
            puts "-----------" if i < 7 
        end
    end

    #Displays the player's options on the board
    def display_options
        i = 0
        while i < 3
            row = board_row(i*3)
            puts " #{row[0]} | #{row[1]} | #{row[2]} "
            i += 1
            puts "-----------" if i < 3
        end
    end

    #Returns an array for move options on the provided row
    def board_row(int)
        return_value = []
        i = 0
        while i < 3
            cell = int + i
            value = self.cells[cell] == " " ? (cell + 1) : self.cells[cell]
            return_value << value
            i += 1
        end
        return_value   
    end

    #Returns value of the board cell, for the provided input
    def position(int)
        self.cells[int.to_i - 1]
    end

    #Returns true for full board
    def full?
        !self.cells.include?(" ")
    end

    #Returns the number of turns taken
    def turn_count
        self.cells.select {|cell| cell != " "}.count
    end

    #Returns true if that position is taken
    def taken?(int)
        self.position(int) != " "
    end

    #Returns true if input is between 1-9 and not taken
    def valid_move?(move)
        move.to_i.between?(1,9) && !self.taken?(move)
    end

    #Updates board with player's token
    def update(int, player)
        self.cells[int.to_i - 1] = player.token
    end
end