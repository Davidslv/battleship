module Battleship
  RSpec.describe Board do
    subject { described_class.new }

    describe '#get' do
      context 'when within board boundaries' do
        it { expect(subject.get(1, 1)).to be_kind_of(Battleship::Water) }
      end

      context 'when outside board boundaries' do
        it { expect(subject.get(11, 11)).to be(false) }
      end
    end

    describe '#set' do
      context 'when within board boundaries' do
        it { expect(subject.set(1, 1, 'A')).to be(true) }

        it 'sets a coordinate with a given value' do
          subject.set(1, 1, 'A')

          expect(subject.get(1, 1)).to eq('A')
        end
      end

      context 'when outside board boundaries' do
        it { expect(subject.set(11, 11, 'A')).to be(false) }
      end
    end

    describe '#to_s' do
      it { expect(subject.to_s).to be_kind_of(String) }
    end

    describe '#to_a' do
      it { expect(subject.to_a).to be_kind_of(Array) }
    end
  end
end
