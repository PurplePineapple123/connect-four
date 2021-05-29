require "./lib/connnect_four"

describe Game do
  describe '#player_selection' do
    context 'Player inputs valid selection (1-7)' do
      subject(:play_game) { described_class.new }

      before do
        allow(play_game).to receive(:puts)
        allow(play_game).to receive(:gets).and_return('3')
      end

      it 'stops loop and does not display error message' do
        error_message = 'Error: Add number between 1-7'
        expect(play_game).not_to receive(:puts).with(error_message)
        play_game.player_selection
      end
    end

    context 'when player inputs an invalid selection' do
      subject(:play_game_error) { described_class.new }

      before do
        allow(play_game_error).to receive(:puts)
        allow(play_game_error).to receive(:gets).and_return('8', '4')
      end

      it 'puts an error message' do
        error_message = 'Error: Add number between 1-7'
        expect(play_game_error).to receive(:puts).with(error_message).once
        play_game_error.player_selection
      end
    end
  end

  describe '#valid_vertical_move' do
    context '' do
      it '' do
        
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

      xit "stores their response" do
        player_input = play_game.player_one_selection
        expect(player_input).to eq(3)
      end
    end
  end

  describe "#valid_move_player_one" do
    subject(:valid_move) { described_class.new }

    context "when player one makes a valid move" do
      before do

      end

      xit "does not output error message" do
        expect(valid_move).not_to receive(:puts)
        valid_move.valid_move_player_one
      end
    end
  end

  describe "#insert_circle_player_one" do
    subject(:insert_piece) { described_class.new }

    before do
      allow(insert_piece).to receive(:valid_move_player_one)
      allow(insert_piece).to receive(:display_board)
    end

    context "when player 1 selects column 4" do
      xit "adds the player's circle piece to column 4" do
        expect(insert_piece)
      end
    end
  end

  describe "#winning_combo" do
    subject(:end_game) { described_class.new }

    context "when 4 in a row" do
      xit "returns a winner" do
        game_over = end_game.winning_combo
        expect(game_over).to eq(true)
      end
    end
  end
end
