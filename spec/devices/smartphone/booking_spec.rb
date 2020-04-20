require 'spec_helper.rb'
require './devices/smartphone/bike'
require './devices/smartphone/booking'
require './devices/smartphone/messages/bookings/create'

describe 'Booking' do
  let(:bike) { Bike.new 2, '1872KXK' }
  let(:booking) { Booking.new 'test@test.com', bike }

  describe '.new' do
    it 'creates a booking' do
      expect(booking.user).to eq 'test@test.com'
      expect(booking.bike).to eq bike
    end
  end

  describe '.save!' do
    let(:time) { Time.mktime(2020,04,19) }
    let(:msg) { double('BookingCreateMessage') }

    before do
      expect(Time).to receive(:now).and_return(time)
      expect(BookingCreateMessage).to receive(:new).with('test@test.com/2').and_return(msg).once
      expect(msg).to receive('send!')
      booking.save!
    end

    it 'notifies the booking creation through API' do
      expect(booking.created_at).to eq time
    end
  end

  describe '.cancel' do
    before { booking.cancel! }

    it 'sets the booking as cancelled' do
      expect(booking.canceled_at).to_not be_nil
    end
  end
end
