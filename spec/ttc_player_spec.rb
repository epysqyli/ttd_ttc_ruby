require_relative '../lib/ttc_player'

describe Player do
# not really necessary to test puts method
  describe "#set_name" do
    subject(:player) { described_class.new }

    it 'assigns a name chosen by the user to the player' do
      allow(player).to receive(:gets).and_return('gigi')
      expect(player.set_name).to eq('gigi')
    end
  end

  describe "#make_move" do
    subject(:player_move) { described_class.new }

    context 'when player enters a valid position' do
      it 'validates the player move' do
        allow(player_move).to receive(:make_move).and_return(7)
        expect(player_move.make_move).to eq(7)
      end
    end
  end
end