describe 'user stories' do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed
  it 'so planes land at airports, instruct a plane to land' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end

  # As an air traffic controller
  # So I can get passengers on the way to their destination
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  it 'so planes take off from airports, instructs a plane to take off' do
  airport = Airport.new(20)
  plane = Plane.new
  expect { airport.take_off(plane) }.not_to raise_error
  end

  # As an air traffic controller
  # So I can avoid collisions
  # I want to prevent planes from landing when airport full
  context 'when airport full' do
    it 'does not allow planes to land' do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return false
        20.times do
          airport.land(plane)
        end
        expect { airport.land(plane)}.to raise_error 'Cant land plane: airport full'
    end
  end


  # As an air traffic controller
  # So I can avoid accidents
  # I want to prevent planes from landing or  taking off during stormy weather
  context 'when weather is stormy' do
    it 'does not allow planes to land' do
      airport = Airport.new(20)
      plane = Plane.new
      allow(airport).to receive(:stormy?).and_return true
      expect { airport.land(plane)}.to raise_error 'Cannot land plane: weather is stormy'
    end
  end
end
