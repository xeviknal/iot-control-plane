require 'spec_helper.rb'
require './devices/smartphone/smartphone'

describe 'Smartphone' do
  let(:smartphone) { Smartphone.new 'test@email.com' }

  describe '.pick_bike' do
    let(:bike) { smartphone.pick_bike}

    it 'returns an available bike' do
      expect(bike).to_not be_nil
      expect(bike.is_available).to be true
    end
  end

  describe '.book_bike' do
    let(:booking) { smartphone.book_bike(bike) }
    let(:bike) { Bike.new 1, '1827KJK' }

    before do
      smartphone.login
    end

    it 'returns a booking' do
      expect(booking.user).to eq 'test@email.com'
      expect(booking.bike.id).to eq bike.id
      expect(booking.created_at).to_not be_nil
    end
  end
end
