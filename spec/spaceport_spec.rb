require 'spaceport'

describe Spaceport do

  subject(:spaceport) { described_class.new }

  it 'instructs a spaceship to dock' do
    expect(spaceport).to respond_to(:dock).with(1).argument
  end

end