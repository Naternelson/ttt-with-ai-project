module Players
    class Human < Player
        def move(board=nil)
            # binding.pry
            gets.chomp
        end
    end
end