require_relative 'game'
require_relative 'board'

puts ' '
puts 'Welcome to console edition of TIC TAC TOE !!! '
puts ' '

def play
    game = Game.new
    game.start
    play_again
end

def play_again

    puts 'Would you like to play again? Type "Y" or "N".'
    respond = gets.chomp

    if respond == 'Y' || respond == 'y'
        puts "Let's play another game!"
        play
    else
        puts 'Thanks for playing!'
        exit
    end 
end

play