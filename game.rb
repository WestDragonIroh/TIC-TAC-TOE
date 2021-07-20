class Game

    WINNABLE_POSITIONS = [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]


    def initialize
        @board = Board.new
        @pos = nil
        @won_game = false
        @player_1 = ''
        @player_1_symbol = ''
        @player_1_array = []
        @player_1_turn = true
        @player_2 = ''
        @player_2_symbol = ''
        @player_2_array = []
    end

    def start 
        run = true
        while run
            puts 'What is the first players name?'
            @player_1 = gets.chomp
            run = !valid_name(@player_1)
        end
        run = true
        while run
            puts 'What is the first players symbol?'
            @player_1_symbol = gets.chomp
            run = !valid_symbol(@player_1_symbol)
        end
        run = true
        while run
            puts 'What is the second players name?'
            @player_2 = gets.chomp
            run = !valid_name(@player_2)
        end
        run = true
        while run
            puts 'What is the second player symbol?'
            @player_2_symbol = gets.chomp
            run = !valid_symbol(@player_2_symbol)
        end
        play_game
    end

    def play_game
        @board.display_board
        turn while @won_game == false
    end

    def turn 
        if @board.board_full?
            puts 'Game is draw!'
            play_again
        end

        puts ' '
        puts "It's #{@player_1_turn ? @player_1 : @player_2}'s turn!"
        puts "Please enter the position (1-9) in which you would like a #{@player_1_turn ? @player_1_symbol : @player_2_symbol} entered."

        run = true
        while run 
            @pos = gets.chomp.to_i
            run = !@board.valid_number?(@pos)
        end

        @board.enter_input(@player_1_turn ? @player_1_symbol : @player_2_symbol, @pos-1)
        @board.display_board
        check 
        swap_player
    end

    def check
        @player_1_turn ? @player_1_array.push(@pos) : @player_2_array.push(@pos)
        won_game? 
    end

    def won_game?
        WINNABLE_POSITIONS.each do |array|
            next unless (array - (@player_1_turn ? @player_1_array : @player_2_array)).empty?

            puts "Congratulations, #{@player_1_turn ? @player_1 : @player_2} has won the game!"
            
            play_again
        end
    end

    def swap_player
        @player_1_turn = if @player_1_turn
                            false
                         else
                            true
                         end
    end

    def valid_name(name)
        if name.length.zero?
            puts "Error: Cannot have name that doesn't exist! Please try again."
            puts ' '
            return false
        elsif @player_1 == @player_2
            puts "Error: Cannot have same name."
            puts ' '
            return false
        end
        return true
    end

    def valid_symbol(symbol)
        if symbol.length > 1
            puts 'Error: Cannot have character more than one character in length! Please try again.'
            puts ' '
            return false
        elsif symbol.length.zero?
            puts "Error: Cannot have character that doesn't exist! Please try again."
            puts ' '
            return false
        elsif @player_1_symbol == @player_2_symbol
            puts 'Error: Cannot have character the same as other player! Please try again.'
            puts ' '
            return false
        end
        return true
    end

end