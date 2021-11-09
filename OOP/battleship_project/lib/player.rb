class Player
    def get_move
        puts 'enter a position with coordinates separated with a space like `4 7`'
        pos = gets.chomp
        arr = []
        arr << pos[0].to_i
        arr << pos[2].to_i
        arr
    end
end