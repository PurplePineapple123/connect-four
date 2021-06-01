#Connect Four Board
class Board
  attr_reader :board

  def initialize(board = Array.new(6) { Array.new(['.', '.', '.', '.', '.', '.', '.']) })
    @board = board
    @x_win = "\"x\", \"x\", \"x\", \"x\""
    @y_win = "\"y\", \"y\", \"y\", \"y\""
    @both_diagonals = []
    @player_win = false
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

 

  def update_board(player, player_turn)
    @board.each do |num|
      if num[player - 1] == '.' && player_turn == 1
        return num[player - 1] = 'x'
      elsif num[player - 1] == '.' && player_turn == 2
        return num[player - 1] = 'y'
      end
    end
  end

  def winning_combo
    row_win_check
    column_win_check
    diagonal_win_check
  end


  def diagonal_wins
    padding = [*0..(@board.length - 1)].map { |i| [nil] * i }

    padded_left = padding.reverse.zip(@board).zip(padding).map(&:flatten)

    padded_right = padding.zip(@board).zip(padding.reverse).map(&:flatten)

    diagonal_left = padded_left.transpose.map(&:compact)
    diagonal_right = padded_right.transpose.map(&:compact)

    @both_diagonals = diagonal_left, diagonal_right
  end


  def row_win_check
    @board.each do |row|
      if row.to_s.include? (@x_win)
        puts 'Player 1 wins'
        return @player_win = true
      elsif row.to_s.include? (@y_win)
        puts 'Player 2 wins'
        return @player_win = true
      end
    end
  end

  def column_win_check
    @board.transpose.each do |column|
      if column.to_s.include? (@x_win)
        puts 'Player 1 wins'
        return @player_win = true
      elsif column.to_s.include? (@y_win)
        puts 'Player 2 wins'
        return @player_win = true
      end
    end
  end

  def diagonal_win_check
    diagonal_wins

    @both_diagonals.each do |diagonal|
      if diagonal.to_s.include? (@x_win)
        puts 'Player 1 wins'
        return @player_win = true
      elsif diagonal.to_s.include? (@y_win)
        puts 'Player 2 wins'
        return @player_win = true
      end
    end
  end

  
end