# lib/connect_four.rb

require_relative 'board.rb'


class Game


  def initialize(game_board = Board.new)
    @game_board = game_board
    @player_turn = 1
    @player = 0
  end

  def player_selection
    loop do
      puts "Choose a column, Player #{@player_turn}:"
      @user_input = gets.chomp

      if @user_input.match?(/\b[1-7]\b/)
        return @player = @user_input.to_i
      else
        puts 'Error: Add number between 1-7'
      end
    end
  end

  def valid_vertical_move
    until @game_board.board[5][@player - 1] == '.'
      puts 'Please place piece in valid spot'
      player_selection
    end
  end

  def insert_circle
    valid_vertical_move
    @game_board.update_board(@player, @player_turn)
    @game_board.display_board
    @player_turn == 1 ? @player_turn = 2 : @player_turn = 1
  end
  

  def play_game
    @game_board.display_board

    loop do
     player_selection
     insert_circle
     @game_board.winning_combo
    end
  end



end

# test = Game.new
# puts test.valid_vertical_move

# if test.valid_vertical_move == nil
#   puts "nil"
# else
#   puts "not nil"
# end