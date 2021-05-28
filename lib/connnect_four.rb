# lib/connect_four.rb

require_relative "board.rb"

class PlayGame
  def initialize(game_board = GameBoard.new)
    @game_board = game_board
    @both_diagonals = []
    @player_turn = 1
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

    @game_board.board.each do |num|
      if num[@player - 1] == '.' && @player_turn == 1
        num[@player - 1] = 'x'
        break
      elsif num[@player - 1] == '.' && @player_turn == 2
        num[@player - 1] = 'y' 
        break
      end
    end
    @game_board.display_board
    @player_turn == 1 ? @player_turn = 2 : @player_turn = 1
  end

  def winning_combo
    x_win = "\"x\", \"x\", \"x\", \"x\""
    y_win = "\"y\", \"y\", \"y\", \"y\""

    @game_board.board.each do |row|
      if row.to_s.include? (x_win)
        puts "Player 1 wins"
        exit
      elsif row.to_s.include? (y_win)
        puts "Player 2 wins"
        exit
      end
    end

    @game_board.board.transpose.each do |column|
      if column.to_s.include? (x_win)
        puts "Player 1 wins"
        exit
      elsif column.to_s.include? (y_win)
        puts "Player 2 wins"
        exit
      end
    end

    diagonal_wins

    @both_diagonals.each do |diagonal|
      if diagonal.to_s.include? (x_win)
        puts "Player 1 wins"
        exit
      elsif diagonal.to_s.include? (y_win)
        puts "Player 2 wins"
        exit
      end
    end
  end

  def diagonal_wins
    padding = [*0..(@game_board.board.length - 1)].map { |i| [nil] * i }

    padded_left = padding.reverse.zip(@game_board.board).zip(padding).map(&:flatten)

    padded_right = padding.zip(@game_board.board).zip(padding.reverse).map(&:flatten)

    diagonal_left = padded_left.transpose.map(&:compact)
    diagonal_right = padded_right.transpose.map(&:compact)

    @both_diagonals = diagonal_left, diagonal_right
  end

  def play_game
    @game_board.display_board

    loop do
     player_selection
     insert_circle
     winning_combo
    end
  end
end

test = PlayGame.new
test.play_game
