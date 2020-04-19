require './devices/smartphone/bike'
require './devices/smartphone/booking'
require './logging'

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
    Logging.error "You are already logged in" if logged_in?
    return if logged_in?
    self.user = self.email
  end

  def logout
    Logging.error "You are already logged out" unless logged_in?
    return unless logged_in?

    self.user = nil
    true
  end

  def pick_bike
    Logging.error "Can't pick a bike unless you are logged in" unless logged_in?
    return unless logged_in?

    bikes = Bike.available
    bike = bikes.sample
  end

  def book_bike(bike)
    Logging.error "Can't do a booking unless you are logged in" unless logged_in?
    Logging.error "Can't do a booking when you have a running booking" if has_booking?
    return if !logged_in? && has_booking?

    self.booking = Booking.new user, bike
    self.booking.save!
  end

  def cancel_booking
    Logging.error "Can't cancel: you don't have a running booking" unless has_booking?
    return unless has_booking?
    booking.cancel!
  end

  def beep
    return unless has_booking?
    booking.bike.beep
  end
end
