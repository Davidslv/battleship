module Battleship
  RSpec.describe Unit do
    subject do
      described_class.new(
        name: 'random',
        size: 0,
        character: 'Z'
      )
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq('Z') }
    end

    describe '#hit?' do
      it { expect(subject.hit?).to be(false) }
    end

    describe '#hit!' do
      it { expect(subject.hit!).to be(false) }
    end

    describe '#sunk?' do
      it { expect(subject.sunk?).to be(false) }
    end
  end
end
