require 'spaceship'

describe Spaceship do
  subject(:spaceship) { described_class.new }
  let(:spaceport) { double :spaceport }

  describe '#release' do
    it { is_expected.to respond_to :release }

    it 'raises an error if already released' do
      expect { spaceship.release }.to raise_error 'Spaceship cannot release: spaceship is not docked'
    end
  end

  describe '#dock' do
    it 'stores the spaceport the ship is docked at' do
      spaceship.dock(spaceport)
      expect(spaceship.spaceport).to eq spaceport
    end

    it 'raises an error if already docked' do
      spaceship.dock(spaceport)
      expect { spaceship.dock(spaceport) }.to raise_error 'Spaceship cannot dock: spaceship already docked'
    end
  end

  describe '#spaceport' do
    it { is_expected.to respond_to :spaceport }

    it 'raises an error if already released' do
      expect { spaceship.spaceport }.to raise_error 'Spaceship cannot be at spaceport: spaceship currently released'
    end
  end
end