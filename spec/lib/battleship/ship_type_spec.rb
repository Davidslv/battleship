module Battleship
  RSpec.describe ShipType do

    describe '.ships' do
      it { expect(described_class.ships).to be_kind_of(Array) }
      it { expect(described_class.ships.count).to eq(5) }

      it 'returns all available ships' do
        expected_characters = %w[C B D S P]

        expect(
          described_class.ships.map(&:to_s)
        ).to eq(expected_characters)
      end
    end
  end
end
