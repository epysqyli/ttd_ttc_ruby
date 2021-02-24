require_relative '../lib/ttc_player'

describe Player do
# not really necessary to test puts method
  # describe "#set_name" do
  #   subject(:player) { described_class.new }

  #   it 'assigns a name chosen by the user to the player' do
  #     allow(player).to receive(:gets).and_return('gigi')
  #     expect(player.set_name).to eq('gigi')
  #   end
  # end

  describe "#verify_position" do
    subject(:game_input) { described_class.new }
    
    context 'when given a valid input as argument' do
      it 'returns true' do
        input = '2'
        output = game_input.verify_position(input)
        expect(output).to be_truthy
      end
    end

    context 'when given an invalid input as argument' do
      it 'returns false' do
        input = 'a'
        output = game_input.verify_position(input)
        expect(output).to be_falsy
      end
    end
  end

  describe '#verify_position' do
    subject(:player_pos) { described_class.new }

    it 'returns the input of #enter_position if valid' do
      value = '5'
      allow(player_pos).to receive(:validate_position).and_return(value)
      #stub allow object to receive method and return value
      expect(player_pos.validate_position).to eq(value)
    end
  end
end
