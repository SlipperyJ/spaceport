require_relative 'security_system'

class Spaceport
  DEFAULT_CAPACITY = 36
  attr_reader :spaceships

  def initialize(security_system, capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @security_system = security_system
    @spaceships = []
  end

  def dock(spaceship)
    raise 'Cannot dock spaceship: spaceport full.' if full?
    raise 'Cannot dock spaceship: security alert active.' if security_alert?
    spaceship.dock(self)
    add_spaceship(spaceship)
  end

  def release(spaceship)
    raise 'Cannot release spaceship: security alert active.' if security_alert?
    raise 'Cannot release spaceship: spaceship is not at this spacestation' unless at_spaceport?(spaceship)
    spaceship.release
    remove_spaceship(spaceship)
    spaceship
  end

  private

  attr_reader :capacity, :security_system

    def full?
      spaceships.length >= capacity
    end

    def security_alert?
      security_system.security_alert?
    end

    def at_spaceport?(spaceship)
      spaceships.include?(spaceship)
    end

    def add_spaceship(spaceship)
      spaceships << spaceship
    end

    def remove_spaceship(spaceship)
      spaceships.delete(spaceship)
    end
end