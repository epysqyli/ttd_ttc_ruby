require_relative '../lib/ttc_player'

describe Player do
# not necessary to test puts methods as there is potentially nothing to go wrong
  describe "#set_name" do
    subject(:player) { described_class.new }

    it 'assigns a name chosen by the user to the player' do
      allow(player).to receive(:gets).and_return('gigi')
      expect(player.set_name).to eq('gigi')
    end
  end
end