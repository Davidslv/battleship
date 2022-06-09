require './lib/battleship'

RSpec.describe Battleship do
  it { expect(described_class.class).to be(Module) }
end
