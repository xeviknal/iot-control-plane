require './devices/smartphone/bike'

class Smartphone
  attr_accessor :user, :email, :booking

  def initialize(email)
    self.email = email
  end

  def logged_in?
    !!self.user
  end

  def has_booking?
    !!self.booking and !self.booking.cancelled?
  end

  def login
    self.user = self.email
  end

  def logout
    return unless logged_in?

    self.user = nil
  end

  def pick_bike
    return unless logged_in?

    bikes = Bike.available
    bike = bikes.sample
  end

  def book_bike(bike)
    return unless logged_in?

    self.booking = Booking.new user, bike
    self.booking.save!
  end

  def cancel_booking
    return unless has_booking?
    booking.cancel!
  end

  def beep
    return unless has_booking?
    booking.bike.beep
  end
end
