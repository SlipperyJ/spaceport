class Spaceport

  def initialize(capacity)
    @capacity = capacity
    @spaceships = []
  end

  def dock(spaceship)
    raise 'Cannot dock spaceship: spaceport full.' if @spaceships.length >= @capacity
    @spaceships << spaceship
  end

  def release(spaceship)
  end

end