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

  describe '.has_booking?' do
    before do
      smartphone.login
    end

    describe 'when has a booking' do
      let(:booking) { smartphone.book_bike(Bike.new 1, '1827KJK') }
      before { booking }

      describe 'and is still running' do
        it 'returns true' do
          expect(smartphone.has_booking?).to be true
        end
      end

      describe 'but is cancelled' do
        before { booking.cancel! }

        it 'returns false' do
          expect(smartphone.has_booking?).to be false
        end
      end
    end

    it 'returns false if theres not booking' do
      expect(smartphone.has_booking?).to be false
    end
  end

  describe '.logged_in?' do
    it 'returns true if smartphone has user' do
      expect(smartphone.logged_in?).to be false
    end

    it 'returns false if smartphone hasnt user' do
      smartphone.login
      expect(smartphone.logged_in?).to be true
    end
  end
end
