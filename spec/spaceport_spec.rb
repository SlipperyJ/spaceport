require 'spaceport'

describe Spaceport do
  subject(:spaceport) { described_class.new(36) }
  let(:spaceship) { double :spaceship }

  describe '#dock' do
    context 'when security alert is inactive' do
      before do
        allow(spaceport).to receive(:security_alert?).and_return false
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
        allow(spaceport).to receive(:security_alert?).and_return true
        expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: security alert active.'
      end
    end
  end

  describe '#release' do
    it 'instructs a spaceship to release' do
      expect(spaceport).to respond_to(:release).with(1).argument
    end
  end
end