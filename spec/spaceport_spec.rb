require 'spaceport'

describe Spaceport do

  subject(:spaceport) { described_class.new(36) }

  it 'instructs a spaceship to dock' do
    expect(spaceport).to respond_to(:dock).with(1).argument
  end

  it 'instructs a spaceship to release' do
    expect(spaceport).to respond_to(:release).with(1).argument
  end

  it 'does not allow docking when at capacity' do
    spaceship = double :spaceship

    36.times do
      spaceport.dock(spaceship)
    end

    expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: spaceport full.'
  end
end