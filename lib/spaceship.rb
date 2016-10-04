class Spaceship

  def initialize
    @docked = false
  end

  def release
    raise 'Spaceship cannot release: spaceship is not docked' unless @docked
  end

  def dock(spaceport)
    raise 'Spaceship cannot dock: spaceship already docked' if @docked
    @docked = true
    @spaceport = spaceport
  end

  def spaceport
    raise 'Spaceship cannot be at spaceport: spaceship currently released' unless @docked
    @spaceport
  end
end