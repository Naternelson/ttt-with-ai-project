module Players
    class Computer < Player
        def move(board)
            answer = 0
            i = 0
            # binding.pry
            while answer == 0
                if board.cells[i] == " "
                    answer = i + 1
                end
                i += 1
            end
            answer.to_s
        end

        # #Retrieves the winning combinations from the Game Class
        # def combos 
        #     Game.win_combos
        # end

        # #Returns the Player's Token
        # def token
        #     board.select{|cell| cell == "X"}.count.even? "X" : "O"
        # end 

        # #Returns the Opponent's Token
        # def opponent
        #     self.token == "X" ? "O" : "X"
        # end

        # #Returns an array of indexes for available positions
        # def availiable_cells
        #     board.each_with_index.collect do |cell,i| 
        #         cell == " "
        #         i
        #     end
        # end

        # #Returns an array of indexes for the player's tokens
        # def taken_cells
        #     board.each_with_index.collect do |cell,i| 
        #         cell == self.token
        #         i
        #     end
        # end

        # #Returns an array of indexes for the opponenet's tokens
        # def opp_cells
        #     board.each_with_index.collect do |cell,i| 
        #         cell == self.opponent
        #         i
        #     end
        # end

        # def to_position(array)
        #     array.collect {{el| el.to_i + 1}
        # end

        # #Returns an array of winiable combinations for this turn, false if none
        # def can_win?
        #     arr =  []
        #     combos.each do |combo|
        #         check = to_position(taken_cells) - combo
        #         (check.count < to_position(taken_cells).count - 1) ? arr << combo : nil   
        #     end
        #     return false if arr == []
        #     arr
        # end

        # #Returns an array of loseable combinations if no action is taken
        # def can_lose?
        #     arr =  []
        #     combos.each do |combo|
        #         check = to_position(opp_cells) - combo
        #         (check.count < to_position(opp_cells).count - 1) ? arr << combo : nil   
        #     end
        #     return false if arr == []
        #     arr
        # end

        # #Determins if this turn can end the game
        # def important_move?
        #     !!self.can_win? && !!self.can_lose?
        # end

        # #Returns a vaild move from a combination
        # def select_from_combo(combination)
        #     combination.find {|pos| to_position(availiable_cells).include?(pos) } 
        # end

        # #Determines if this is the first move, if so, return 5
        # def first_move?
        #     return 5 if board.count == self.availiable_cells.count
        # end

        # def select_move 
        #     return first_move if !!first_move
        #     combos.select {|combo| self.taken_cells - combo}

        # end
    end
end