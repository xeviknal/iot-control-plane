require 'spec_helper.rb'
require './devices/smartphone/bike'

describe 'Bike' do
  describe '.new' do
    let(:bike) { Bike.new 1, '8287KAJ' }

    it 'creates an available bike' do
      expect(bike.is_available).to be true
    end
  end

  describe '#available' do
    let(:bikes) { Bike.available }
    it 'return a list of bikes' do
      expect(bikes.size).to eq(4)
      expect(bikes.all?(&:is_available)).to be true
    end
  end
end
