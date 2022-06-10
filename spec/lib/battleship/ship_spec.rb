module Battleship
  RSpec.describe Ship do
    subject do
      described_class.new(name: 'Carrier', size: 5, character: 'C')
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq('C') }
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
