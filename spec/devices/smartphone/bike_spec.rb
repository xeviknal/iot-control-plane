require 'spec_helper.rb'
require './devices/smartphone/bike'
require './devices/smartphone/messages/bikes/beep'

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

  describe '.create' do
    let(:time) { Time.mktime(2020,04,19) }
    let(:msg) { double('BikeCreateMessage') }

    before do
      expect(Time).to receive(:now).and_return(time)
      expect(BikeCreateMessage).to receive(:new).with('1/8287KAJ').and_return(msg).once
      expect(msg).to receive('send!').once

      bike.save!
    end

    it 'announces a new bike' do
      expect(bike.created_at).to eq time
    end
  end

  describe '.beep' do
    let(:time) { Time.mktime(2020,04,19) }
    let(:msg) { double('BeepMessage') }

    before do
      expect(Time).to receive(:now).and_return(time)
      expect(BeepMessage).to receive(:new).with('1/8287KAJ').and_return(msg).once
      expect(msg).to receive('send!').once

      bike.beep
    end

    it 'request a beep' do
      expect(bike.last_beep_at).to eq time
    end
  end
end
