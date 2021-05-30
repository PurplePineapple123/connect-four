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

    subject(:valid_move) { described_class.new(new_board) }
    let(:new_board) {instance_double(Board)}

    context 'when a valid move is placed' do

      before do

        board = [['x', '.', '.', '.', '.', '.', '.'], ['x', '.', '.', '.', '.', '.', '.'],
        ['x', '.', '.', '.', '.', '.', '.'], ['x', '.', '.', '.', '.', '.', '.'],
        ['x', '.', '.', '.', '.', '.', '.'], ['.', '.', '.', '.', '.', '.', '.']]

        allow(new_board).to receive(:board).and_return(board)


        allow(valid_move).to receive(:player_selection).and_return(1)
      end

      it 'does not receive error message' do
        expect(valid_move).not_to receive(:puts)
        valid_move.valid_vertical_move
      
      end
    end
  end


  describe '#insert_circle' do
    let(:board) { instance_double(Board) }

    subject(:insert_piece) { described_class.new(board) }

    before do
      allow(insert_piece).to receive(:valid_vertical_move)
      allow(board).to receive(:update_board).and_return('x')
      allow(board).to receive(:display_board)
    end

    context 'when player adds the  piece to column' do
      it 'game changes turn to next player' do
        next_turn = insert_piece.insert_circle 
        expect(next_turn).to eq(2)
      end
    end
  end

  describe '#diagonal_moves' do
    subject(:diagonal) { described_class.new(new_board) }
    let(:new_board) { instance_double(Board) }
    
    context '' do
      xit 'returns an array of moves to be checked' do

      end
    end
  end



end
