require_relative 'security_system'

class Spaceport

  def initialize(capacity, security_system)
    @capacity = capacity
    @security_system = security_system
    @spaceships = []
  end

  def dock(spaceship)
    raise 'Cannot dock spaceship: spaceport full.' if full?
    raise 'Cannot dock spaceship: security alert active.' if security_alert?
    @spaceships << spaceship
  end

  def release(spaceship)
    raise 'Cannot release spaceship: security alert active.' if security_alert?
  end

  private

    def full?
      @spaceships.length >= @capacity
    end

    def security_alert?
      @security_system.security_alert?
    end
end