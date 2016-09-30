describe 'User Stories' do
  let(:spaceport) { Spaceport.new(36) }
  let(:spaceship) { Spaceship.new }
  context 'when security alert inactive' do
    before do
      allow(spaceport).to receive(:security_alert?).and_return false
    end

    it 'so spaceships dock at spaceports, instruct a spaceship to dock' do
      expect { spaceport.dock(spaceship) }.not_to raise_error
    end

    it 'so spaceships un-dock from spaceports, instruct a spaceship to un-dock' do
      expect { spaceport.release(spaceship) }.not_to raise_error
    end

    context 'when spacestation is full' do
      it 'does not allow spaceships to dock' do
        36.times do
          spaceport.dock(spaceship)
        end
        expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: spaceport full.'
      end
    end
  end

  # As a spaceport traffic controller
  # So that I can ensure safe release procedures
  # I want to prevent spaceships from docking or releasing during security alerts
  context 'when security alert is active' do
    before do
      allow(spaceport).to receive(:security_alert?).and_return true
    end
    it 'does not allow spaceships to dock' do
      expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: security alert active.'
    end
  end
end