#spec/connect_four_spec.rb
require "./lib/connnect_four"

describe GameBoard do
  subject(:board) { described_class.new }

  context "prints out the game board" do
    it "using puts 7 times" do
      expect(board).to receive(:puts).exactly(7).times
      board.create_board
      board.display_board
    end
  end
end

describe PlayGame do
  describe "#player_one selection" do
    context "prompts player 1 to select a slot (1-7)" do
      subject(:play_game) { described_class.new }

      before do
        allow(play_game).to receive(:puts)
        allow(play_game).to receive(:gets).and_return("3")
      end

      it "stops loop and does not display error message" do
        error_message = "Error: Add number between 1-7"
        expect(play_game).not_to receive(:puts).with(error_message)
        play_game.player_one_selection
      end
    end
  end

  describe "#player_two selection" do
    context "prompts player 2 to select a slot (1-7)" do
      subject(:play_game) { described_class.new }

      before do
        allow(play_game).to receive(:puts)
        allow(play_game).to receive(:gets).and_return("3")
      end

      it "stores their response" do
        player_input = play_game.player_one_selection
        expect(player_input).to eq(3)
      end
    end
  end

  describe "#insert_circle_player_one" do
    subject(:insert_piece) { described_class.new }

    before do
      allow(insert_piece).to receive(:display_board)
      allow(insert_piece).to receive(:player_one_selection).and_return(5)
    end

    context "when player 1 selects column 4" do
      xit "adds the player's circle piece to column 4" do
        expect(insert_piece)
      end
    end
  end

  describe "#winning_combo" do
    subject(:end_game) {described_class.new}

    context "when 4 in a row" do
      it "returns a winner" do
        game_over = end_game.winning_combo
        expect(game_over).to eq(true)
      end
    end
  end
end
