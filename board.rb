class Board

    def initialize
        @cell = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def display_board
        puts " #{@cell[0]} | #{@cell[1]} | #{@cell[2]}"
        puts ' --+---+--'
        puts " #{@cell[3]} | #{@cell[4]} | #{@cell[5]}"
        puts ' --+---+--'
        puts " #{@cell[6]} | #{@cell[7]} | #{@cell[8]}"
    end

    def enter_input(player_symbol, new_pos)
        @cell[new_pos] = player_symbol
    end

    def board_full?
        old_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        num_full = 0
        old_board.each_with_index do |pos, index|
        num_full += 1 if @cell[index] != pos
        end
        num_full == old_board.length
    end

    def valid_number?(num)
        if @cell[num - 1] == num
            return true
        else  
            puts 'Error: Invalid input! Please try again.'
            return false
        end
    end

end
