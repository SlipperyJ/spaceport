describe 'User Stories' do
  let(:spaceport) { Spaceport.new(security_system, 36) }
  let(:spaceship) { Spaceship.new }
  let(:security_system) { SecuritySystem.new }

  context 'when security alert inactive' do
    before do
      allow(spaceport).to receive(:security_alert?).and_return false
    end

    it 'so spaceships dock at spaceports, instruct a spaceship to dock' do
      expect { spaceport.dock(spaceship) }.not_to raise_error
    end

    it 'so spaceships release from spaceports, instruct a spaceship to release' do
      spaceport.dock(spaceship)
      expect { spaceport.release(spaceship) }.not_to raise_error
    end

    it 'releases a spaceship only from a spaceport the are docked' do
      spaceport2 = Spaceport.new(security_system, 36)
      allow(spaceport2).to receive(:security_alert?).and_return false
      spaceport2.dock(spaceship)
      expect { spaceport.release(spaceship) }.to raise_error 'Cannot release spaceship: spaceship is not at this spacestation'
    end

    it 'spaceports have a default capacity' do
      default_spaceport = Spaceport.new(security_system)
      allow(default_spaceport).to receive(:security_alert?).and_return false
      Spaceport::DEFAULT_CAPACITY.times { default_spaceport.dock(spaceship) }
      expect { default_spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: spaceport full.'
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

  context 'when security alert is active' do
    before do
      allow(spaceport).to receive(:security_alert?).and_return true
    end
    it 'does not allow spaceships to dock' do
      expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: security alert active.'
    end

    it 'does not allow spaceships to release' do
      expect { spaceport.release(spaceship) }.to raise_error 'Cannot release spaceship: security alert active.'
    end
  end
end