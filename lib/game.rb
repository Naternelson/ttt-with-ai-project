class Game
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    attr_accessor :board, :player_1, :player_2

    #Intializes a new game with two players and a board. The defaults for Player 1 and 2 and Human with a new board
    def initialize(player_1=Players::Human.new("X"),player_2=Players::Human.new("O"),board=Board.new)
        self.player_1 = player_1
        self.player_2 = player_2
        self.board = board
    end

    #Returns the current_player
    def current_player
        self.board.turn_count.even? ? player_1 : player_2
    end

    #Returns winning combination if there is a winner, false for a draw
    def won?
        o_positions = []
        x_positions = []
        self.board.cells.each_with_index do |el, i|
            o_positions << i if el == "O"
            x_positions << i if el == "X"
        end

        WIN_COMBINATIONS.each do |combo|
            return combo if combo & o_positions == combo
            return combo if combo & x_positions == combo
        end
        false
    end

    #Returns true if the board is full and there are no winners
    def draw?
        self.board.full? && !self.won?
    end

    #Returns true is either there is a draw or a winner
    def over?
        self.draw? || !!self.won?
    end

    #Returns the winning token
    def winner
        if !!self.won?
            position = self.won?[0]
            self.board.cells[position]
        end
    end

    #Gets a value from player, validates and updates board
    def turn
        value = current_player.move
        self.turn if !self.board.valid_move?(value)
        self.board.update(value, current_player)
    end

    def play
        self.turn until over?
        puts "Congratulations #{self.winner}!" if self.won?
        puts "Cat\'s Game!" if self.draw?
    end

    def self.win_combos
        WIN_COMBINATIONS
    end
end