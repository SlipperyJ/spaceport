require 'spaceport'

describe Spaceport do
  subject(:spaceport) { described_class.new(36) }
  let(:spaceship) { double :spaceship }

  describe '#dock' do

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

  describe '#release' do
    it 'instructs a spaceship to release' do
      expect(spaceport).to respond_to(:release).with(1).argument
    end
  end
end