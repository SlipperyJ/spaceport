describe 'User Stories' do
  # As a spaceport traffic controller
  # So spaceships can dock safely and efficiently at my spaceport
  # I would like to instruct a spaceship to dock
  it 'so spaceships dock at spaceports, instruct a spaceship to dock' do
    spaceport = Spaceport.new
    spaceship = Spaceship.new
    expect { spaceport.dock(spaceship) }.not_to raise_error
  end

  # `As a spaceport traffic controller
  # `So spaceships can take off safely from my spaceport
  # `I would like to instruct a spaceship to release
  it 'so spaceships un-dock from spaceports, instruct a spaceship to un-dock' do
    spaceport = Spaceport.new
    spaceship = Spaceship.new
    expect { spaceport.release(spaceship) }.not_to raise_error
  end
end