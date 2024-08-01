require 'rails_helper'

RSpec.describe DistanceCalculator, type: :service do
  it 'calculates the correct distance between two points' do
    distance = DistanceCalculator.haversine(19.0590317, 72.7553452, 19.0600000, 72.7600000)
    expect(distance).to be_within(0.1).of(0.5)
  end
end
