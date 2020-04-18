require 'spec_helper.rb'
require './devices/smartphone/bike'

describe 'Bike' do
  let(:bike) { Bike.new 1, '8287KAJ' }

  describe '.new' do
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

  describe '.beep' do
    let(:time) { Time.mktime(2020,04,19) }

    before do
      allow(Time).to receive(:now).and_return(time)
      bike.beep
    end

    it 'request a beep' do
      expect(bike.last_beep_at).to eq time
    end
  end
end
