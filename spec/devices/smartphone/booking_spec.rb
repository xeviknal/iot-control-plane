require 'spec_helper.rb'
require './devices/smartphone/booking'

describe 'Booking' do
  let(:booking) { Booking.new 'test@test.com', 2 }

  describe '.new' do
    it 'creates a booking' do
      expect(booking.user).to eq 'test@test.com'
      expect(booking.bike).to eq 2
      expect(booking.created_at).to_not be_nil
    end
  end

  describe '.save!' do
    before { booking.save! }

    xit 'notifies the booking creation through API' do
    end
  end

  describe '.cancel' do
    before { booking.cancel! }

    it 'sets the booking as cancelled' do
      expect(booking.canceled_at).to_not be_nil
    end
  end
end
