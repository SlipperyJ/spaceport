class Spaceship
  def release
    raise 'Spaceship cannot release: spaceship is not docked'
  end

  def spaceport
    raise 'Spaceship cannot be at spaceport: spaceship currently released'
  end
end