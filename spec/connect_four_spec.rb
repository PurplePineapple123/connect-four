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

    context "when player 1 inputs a valid move" do
      it "expect x to be added to board" do
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

    context 'when a column is full' do

      before do
       
      end
      it 'does not add a piece to the board' do
        full_column = update.update_board(1, 1)
        expect(full_column).to eq nil
      end
    end
  end
end

