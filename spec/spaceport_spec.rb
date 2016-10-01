require 'spaceport'

describe Spaceport do
  subject(:spaceport) { described_class.new(36, security_system) }
  let(:spaceship) { double :spaceship }
  let(:security_system) { double :security_system }

  describe '#dock' do
    context 'when security alert is inactive' do
      before do
        allow(security_system).to receive(:security_alert?).and_return false
      end

      it 'instructs a spaceship to dock' do
        expect(spaceport).to respond_to(:dock).with(1).argument
      end

      context 'when full' do
        it 'raises an error' do
          36.times do
            spaceport.dock(spaceship)
          end
          expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: spaceport full.'
        end
      end
    end

    context 'when security alert is active' do
      it 'raises an error if the spaceship docks during a security alert' do
        allow(security_system).to receive(:security_alert?).and_return true
        expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: security alert active.'
      end
    end
  end

  describe '#release' do
    context 'when security alert is inactive' do
      before do
        allow(security_system).to receive(:security_alert?).and_return false
      end

      it 'instructs a spaceship to release' do
        expect(spaceport).to respond_to(:release).with(1).argument
      end

      it 'raises an error if the spaceship is not docked at this spaceport' do
        other_spaceport = Spaceport.new(36, security_system)
        other_spaceport.dock(spaceship)
        expect { spaceport.release(spaceship) }.to raise_error 'Cannot release spaceship: spaceship is not at this spacestation'
      end
    end

    context 'when security alert is active' do
      before do
        allow(security_system).to receive(:security_alert?).and_return true
      end

      it 'raises an error' do
        expect{ spaceport.release(spaceship) }.to raise_error 'Cannot release spaceship: security alert active.'
      end
    end
  end
end