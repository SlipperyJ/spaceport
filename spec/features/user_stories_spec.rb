describe 'User Stories' do
  # As a spaceport traffic controller
  # So spaceships can dock safely and efficiently at my spaceport
  # I would like to instruct a spaceship to dock
  it 'so spaceships dock at spaceports, instruct a spaceship to dock' do
    spaceport = Spaceport.new(36)
    spaceship = Spaceship.new
    expect { spaceport.dock(spaceship) }.not_to raise_error
  end

  # `As a spaceport traffic controller
  # `So spaceships can take off safely from my spaceport
  # `I would like to instruct a spaceship to release
  it 'so spaceships un-dock from spaceports, instruct a spaceship to un-dock' do
    spaceport = Spaceport.new(36)
    spaceship = Spaceship.new
    expect { spaceport.release(spaceship) }.not_to raise_error
  end

  # As a spaceport traffic controller
  # So I can prevent spaceship collisions and time wasting
  # I would like to prevent spaceships from docking when the spaceport is full
  it 'does not allow spaceships to dock when the spaceport is full' do
    spaceport = Spaceport.new(36)
    spaceship = Spaceship.new

    36.times do
      spaceport.dock(spaceship)
    end

    expect { spaceport.dock(spaceship) }.to raise_error 'Cannot dock spaceship: spaceport full.'

  end
end