module Battleship
  RSpec.describe Unit do
    subject do
      described_class.new(
        name: 'random',
        size: 0,
        character: 'Z',
        reveal: reveal
      )
    end
    let(:reveal) { true }

    describe '#to_s' do
      context 'when reveal is true' do
        it { expect(subject.to_s).to eq('Z') }
      end

      context 'when reveal is false' do
        let(:reveal) { false }

        it { expect(subject.to_s).to eq('~') }
      end
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
