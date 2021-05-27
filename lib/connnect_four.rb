#lib/connect_four.rb

class GameBoard
  
  attr_reader :board

  def initialize
    @board = []
    @both_diagonals = []
  end

  def create_board
    @board = [[".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."],
              [".", ".", ".", ".", ".", ".", "."], [".", ".", ".", ".", ".", ".", "."]]
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
    @player_1 = 0
    @player_2 = 0
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







  def valid_move_player_one
    until @board[5][@player_1 - 1] == "."
      puts "Please place piece in valid spot"
      player_one_selection
    end
  end





  def insert_circle_player_one
    valid_move_player_one

    @board.each do |num|
      if num[@player_1 - 1] == "."
        num[@player_1 - 1] = "x"
        break
      end
    end

    display_board(@board)
  end

  def valid_move_player_two
    until @board[5][@player_2 - 1] == "."
      puts "Please place piece in valid spot"
      player_two_selection
    end
  end

  def insert_circle_player_two
    valid_move_player_two

    @board.each do |num|
      if num[@player_2 - 1] == "."
        num[@player_2 - 1] = "y"
        break
      end
    end

    display_board(@board)
  end

  def winning_combo
    x_win = "\"x\", \"x\", \"x\", \"x\""
    y_win = "\"y\", \"y\", \"y\", \"y\""

    @board.each do |row|
      if row.to_s.include? (x_win)
        puts "Player 1 wins"
        exit
      elsif row.to_s.include? (y_win)
        puts "Player 2 wins"
        exit
      end
    end

    @board.transpose.each do |column|
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
    padding = [*0..(@board.length - 1)].map { |i| [nil] * i }

    padded_left = padding.reverse.zip(@board).zip(padding).map(&:flatten)

    padded_right = padding.zip(@board).zip(padding.reverse).map(&:flatten)

    diagonal_left = padded_left.transpose.map(&:compact)
    diagonal_right = padded_right.transpose.map(&:compact)

    @both_diagonals = diagonal_left, diagonal_right
  end

  def play_game
    create_board
    display_board

    loop do
      player_one_selection
      insert_circle_player_one
      winning_combo

      player_two_selection
      insert_circle_player_two
      winning_combo
    end
  end
end

# test = PlayGame.new

# test.play_game
# test.create_board
