module Battleship
  RSpec.describe Ship do
    subject do
      described_class.new(name: 'Carrier', size: 5, character: 'C', reveal: reveal)
    end
    let(:reveal) { true }

    describe '#to_s' do
      context 'when reveal is true' do
        it { expect(subject.to_s).to eq('C') }
      end

      context 'when reveal is false' do
        let(:reveal) { false }

        it { expect(subject.to_s).to eq('~') }
      end
    end

    describe '#hit?' do
      it { expect(subject.hit?).to be(true) }
    end

    describe '#hit!' do
      it { expect(subject.hit!).to be(true) }
    end

    describe '#sunk?' do
      it { expect(subject.sunk?).to be(false) }

      context 'when ship has been hit as many times as its size' do
        it 'returns true' do
          subject.size.times do
            subject.hit!
          end

          expect(subject.sunk?).to be(true)
        end
      end
    end
  end
end
