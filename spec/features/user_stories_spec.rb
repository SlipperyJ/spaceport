describe 'User Stories' do
  let(:spaceport) { Spaceport.new(security_system, 36) }
  let(:spaceship) { Spaceship.new }
  let(:security_system) { SecuritySystem.new }

  context 'when security alert inactive' do
    before do
      allow(security_system).to receive(:security_alert?).and_return false
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
      spaceport2.dock(spaceship)
      expect { spaceport.release(spaceship) }.to raise_error 'Cannot release spaceship: spaceship is not at this spacestation'
    end

    it 'spaceports have a default capacity' do
      default_spaceport = Spaceport.new(security_system)
      Spaceport::DEFAULT_CAPACITY.times do
        another_spaceship = Spaceship.new
        default_spaceport.dock(another_spaceship)
      end
      expect { default_spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: spaceport full.'
    end

    it 'released spaceships cannot take off' do
      expect { spaceship.release }.to raise_error 'Spaceship cannot release: spaceship is not docked'
    end

    it 'released spaceships cannot be in a spaceport' do
      expect { spaceship.spaceport }.to raise_error 'Spaceship cannot be at spaceport: spaceship currently released'
    end

    it 'docked spaceships cannot dock' do
      spaceport.dock(spaceship)
      expect { spaceship.dock(spaceport) }.to raise_error 'Spaceship cannot dock: spaceship already docked'
    end

    it 'docked spaceships must be in a spaceport' do
      spaceport.dock(spaceship)
      expect(spaceship.spaceport).to eq spaceport
    end

    it 'releasing a spaceship removes it from that spaceport' do
      spaceport.dock(spaceship)
      spaceport.release(spaceship)
      expect(spaceport.spaceships).not_to include spaceship
    end

    context 'when spacestation is full' do
      it 'does not allow spaceships to dock' do
        Spaceport::DEFAULT_CAPACITY.times do
          another_spaceship = Spaceship.new
          spaceport.dock(another_spaceship)
        end
        expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: spaceport full.'
      end
    end
  end

  context 'when security alert is active' do
    before do
      allow(security_system).to receive(:security_alert?).and_return true
    end
    it 'does not allow spaceships to dock' do
      expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: security alert active.'
    end

    it 'does not allow spaceships to release' do
      expect { spaceport.release(spaceship) }.to raise_error 'Cannot release spaceship: security alert active.'
    end
  end
end