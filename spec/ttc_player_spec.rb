require_relative '../lib/ttc_player'

describe Player do
# not really necessary to test puts method
  describe "#set_name" do
    subject(:player) { described_class.new }

    xit 'assigns a name chosen by the user to the player' do
      allow(player).to receive(:gets).and_return('gigi')
      expect(player.set_name).to eq('gigi')
    end
  end

  describe "#verify_input" do
    subject(:game_input) { described_class.new }
    
    context 'when given a valid input as argument' do
      it 'returns the input' do
        input = '2'
        output = game_input.verify_input(input)
        expect(output).to eq('2')
      end
    end

    context 'when given an invalid input as argument' do
      it 'returns nil' do
        input = 'a'
        output = game_input.verify_input(input)
        expect(output).to be_nil
      end
    end
  end
end