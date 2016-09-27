class Spaceport

  def initialize(capacity)
    @capacity = capacity
    @spaceships = []
  end

  def dock(spaceship)
    raise 'Cannot dock spaceship: spaceport full.' if full?
    @spaceships << spaceship
  end

  def release(spaceship)
  end

  private

    def full?
      @spaceships.length >= @capacity
    end
end