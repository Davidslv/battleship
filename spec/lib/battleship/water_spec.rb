module Battleship
  RSpec.describe Water do
    subject do
      described_class.new
    end

    describe '#to_s' do
      it { expect(subject.to_s).to eq('~') }
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
