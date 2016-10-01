require 'rspec'
require 'security_system'

describe SecuritySystem do
  subject(:security_system) { described_class.new }

  describe '#security_alert?' do

    it 'can be inactive' do
      allow(Kernel).to receive(:rand).and_return(5)
      expect(security_system.security_alert?).to be false
    end

    it 'can be active' do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(security_system.security_alert?).to be true
    end
  end
end