#spec/connect_four_spec.rb
require "./lib/board"

describe Board do
  subject(:board) { described_class.new }

  describe "#display_board" do
    context "prints out the game board" do
      it "using puts 7 times" do
        expect(board).to receive(:puts).exactly(7).times
        board.display_board
      end
    end
  end

  describe "#update_board" do
    subject(:update) { described_class.new }

    context 'when player 1 inputs a valid move' do
      it 'expect x to be added to board' do
        x_move = update.update_board(4, 1)
        expect(x_move).to eq("x")
      end
    end

    context "when player 2 inputs a valid move" do
      it "expect y to be added to board" do
        y_move = update.update_board(3, 2)
        expect(y_move).to eq("y")
      end
    end

   
  end

  describe '#diagonal_wins' do
    subject(:diagonal) { described_class.new }
    
    context 'when player adds to board' do
      it 'returns an array of diagonal moves to be checked' do
        expect(diagonal.diagonal_wins.class).to eq (Array)
      end
    end
  end


  describe '#row_win_check' do

    subject(:game_win) { described_class.new }

    context 'when 4 Xs in a row' do

      before do
        board = [['x', 'x', 'x', 'x', '.', '.', '.'], 
        ['y', '.', '.', '.', '.', '.', '.'], ['y', '.', '.', '.', '.', '.', '.'], 
        ['y', '.', '.', '.', '.', '.', '.'], ['x', '.', '.', '.', '.', '.', '.'], 
        ['x', '.', '.', '.', '.', '.', '.']]   
        
        game_win.instance_variable_set(:@board, board)
      end

      it 'returns true for win' do
        game = game_win.row_win_check
        expect(game).to eq(true)
      end
    end
  end

  describe '#column_win_check' do

    subject(:game_win) { described_class.new }

    context 'when 4 Ys in a column' do

      before do
        board = [['x', 'y', 'x', 'x', '.', '.', 'y'], 
        ['y', '.', '.', '.', '.', '.', 'y'], ['y', '.', '.', '.', '.', '.', 'y'], 
        ['y', '.', '.', '.', '.', '.', 'y'], ['x', '.', '.', '.', '.', '.', '.'], 
        ['x', '.', '.', '.', '.', '.', '.']]   
        
        game_win.instance_variable_set(:@board, board)
      end

      it 'returns true for win' do
        game = game_win.column_win_check
        expect(game).to eq(true)
      end
    end
  end

  describe '#diagonal_win_check' do

    subject(:game_win) { described_class.new }

    context 'when 4 Xs in a diagonal row' do

      before do
        board = [['x', 'y', 'x', 'x', '.', '.', 'y'], 
        ['y', 'x', '.', '.', '.', '.', 'y'], ['y', '.', 'x', '.', '.', '.', 'y'], 
        ['y', '.', '.', 'x', '.', '.', 'y'], ['x', '.', '.', '.', '.', '.', '.'], 
        ['x', '.', '.', '.', '.', '.', '.']]   
        
        game_win.instance_variable_set(:@board, board)
        game_win.diagonal_wins
      end

      it 'returns true for win' do
        game = game_win.diagonal_win_check
        expect(game).to eq(true)
      end
    end
  end


end
