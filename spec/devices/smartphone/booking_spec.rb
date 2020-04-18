require 'spec_helper.rb'
require './devices/smartphone/booking'

describe 'Booking' do
  describe '.new' do
    let(:booking) { Booking.new 'test@test.com', 2 }

    it 'creates a booking' do
      expect(booking.user).to eq 'test@test.com'
      expect(booking.bike).to eq 2
      expect(booking.created_at).to_not be_nil
    end
  end
end
