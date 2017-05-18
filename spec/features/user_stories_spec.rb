describe 'user stories' do
  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed
  context 'when not stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end
    it 'so planes land at airports, instruct a plane to land' do
      expect { airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
    it 'so planes take off from airports, instructs a plane to take off' do
    expect { airport.take_off(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So I can avoid collisions
    # I want to prevent planes from landing when airport full
    context 'when airport full' do
      it 'does not allow planes to land' do
          20.times do
            airport.land(plane)
          end
          expect { airport.land(plane)}.to raise_error 'Cant land plane: airport full'
      end
    end
  end

  # As an air traffic controller
  # So I can avoid accidents
  # I want to prevent planes from landing or  taking off during stormy weather
  context 'when weather is stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end
    it 'does not allow planes to land' do
      expect { airport.land(plane)}.to raise_error 'Cannot land plane: weather is stormy'
    end
  end
end
