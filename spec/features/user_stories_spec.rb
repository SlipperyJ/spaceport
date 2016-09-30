describe 'User Stories' do

  it 'so spaceships dock at spaceports, instruct a spaceship to dock' do
    spaceport = Spaceport.new(36)
    spaceship = Spaceship.new
    allow(spaceport).to receive(:security_alert?).and_return false
    expect { spaceport.dock(spaceship) }.not_to raise_error
  end

  it 'so spaceships un-dock from spaceports, instruct a spaceship to un-dock' do
    spaceport = Spaceport.new(36)
    spaceship = Spaceship.new
    expect { spaceport.release(spaceship) }.not_to raise_error
  end

  context 'when spacestation is full' do
    it 'does not allow spaceships to dock' do
      spaceport = Spaceport.new(36)
      spaceship = Spaceship.new
      allow(spaceport).to receive(:security_alert?).and_return false
      36.times do
        spaceport.dock(spaceship)
      end
      expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: spaceport full.'
    end
  end

  # As a spaceport traffic controller
  # So that I can ensure safe release procedures
  # I want to prevent spaceships from docking or releasing during security alerts
  context 'when security alert is active' do
    it 'does not allow spaceships to dock' do
      spaceport = Spaceport.new(36)
      spaceship = Spaceship.new

      allow(spaceport).to receive(:security_alert?).and_return true
      expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: security alert active.'
    end
  end
end