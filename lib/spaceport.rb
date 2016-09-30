class Spaceport

  def initialize(capacity)
    @capacity = capacity
    @spaceships = []
  end

  def dock(spaceship)
    raise 'Cannot dock spaceship: spaceport full.' if full?
    raise 'Cannot dock spaceship: security alert active.' if security_alert?
    @spaceships << spaceship
  end

  def release(spaceship)
  end

  private

    def full?
      @spaceships.length >= @capacity
    end

    def security_alert?
      rand(1..10) < 3
    end
end