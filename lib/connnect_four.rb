#lib/connect_four.rb

class GameBoard
  def initialize
    @board = []
  end

  def create_board
    @board = [[".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."]]
  end

  def display_board(board = @board)
    puts "| #{board[5][0]} | #{board[5][1]} | #{board[5][2]} | #{board[5][3]} | #{board[5][4]} | #{board[5][5]} | #{board[5][6]} |"
    puts "| #{board[4][0]} | #{board[4][1]} | #{board[4][2]} | #{board[4][3]} | #{board[4][4]} | #{board[4][5]} | #{board[4][6]} |"
    puts "| #{board[3][0]} | #{board[3][1]} | #{board[3][2]} | #{board[3][3]} | #{board[3][4]} | #{board[3][5]} | #{board[3][6]} |"
    puts "| #{board[2][0]} | #{board[2][1]} | #{board[2][2]} | #{board[2][3]} | #{board[2][4]} | #{board[2][5]} | #{board[2][6]} |"
    puts "| #{board[1][0]} | #{board[1][1]} | #{board[1][2]} | #{board[1][3]} | #{board[1][4]} | #{board[1][5]} | #{board[1][6]} |"
    puts "| #{board[0][0]} | #{board[0][1]} | #{board[0][2]} | #{board[0][3]} | #{board[0][4]} | #{board[0][5]} | #{board[0][6]} |"
    puts "  1 | 2 | 3 | 4 | 5 | 6 | 7  "
  end
end

class PlayGame < GameBoard
  def initialize
    @player_1
    @player_2
  end

  def player_one_selection
    puts "Choose a column, Player 1:"

    loop do
      user_input = gets.chomp
      @player_1 = user_input.to_i if user_input.match?(/\b[1-7]\b/)
      return @player_1 if @player_1

      puts "Error: Add number between 1-7"
    end
  end

  def player_two_selection
    puts "Choose a column, Player 2:"

    loop do
      user_input = gets.chomp

      @player_2 = user_input.to_i if user_input.match?(/\b[1-7]\b/)
      return @player_2 if @player_2

      puts "Error: Add number between 1-7"
    end
  end

  def insert_circle_player_one
    @board.each do |num|
      if num[@player_1 - 1] == "."
        num[@player_1 - 1] = "x"
        break
      end
    end

    display_board(@board)
  end

  def insert_circle_player_two
    @board.each do |num|
      if num[@player_2 - 1] == "."
        num[@player_2 - 1] = "y"
        break
      end
    end
    display_board(@board)
  end

  #check_for_winning method (do until one player had 4 in a row)

  def winning_combo
    winning = [["x", "x", "x", "x"], ["y", "y", "y", "y"]]

    @board.each do |row|
      if (winning[0] - row).empty?
        puts "Player 1 wins"
        exit
      elsif (winning[1] - row).empty?
        puts "Player 2 wins"
        exit
      end
    end

    @board.transpose.each do |column|
      if (winning[0] - column).empty?
        puts "Player 1 wins B"
        exit
      elsif (winning[1] - column).empty?
        puts "Player 2 wins"
        exit
      end
    end
  end
end

test = PlayGame.new
test.create_board
test.display_board

test.player_one_selection
test.insert_circle_player_one

test.player_one_selection
test.insert_circle_player_one

test.player_one_selection
test.insert_circle_player_one

test.player_one_selection
test.insert_circle_player_one
test.winning_combo

# test.player_two_selection
# test.insert_circle_player_two
