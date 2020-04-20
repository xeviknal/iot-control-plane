require './devices/smartphone/messages/bookings/create'
require './devices/smartphone/messages/bookings/cancel'

class Booking
  attr_accessor :user, :bike, :created_at, :canceled_at

  def initialize(user, bike)
    self.user = user
    self.bike = bike
  end

  def message_id
    "#{self.user}/#{self.bike.id}"
  end

  def save!
    BookingCreateMessage.new(message_id).send!
    self.created_at = Time.now

    self
  end

  def cancel!
    BookingCancelMessage.new(message_id).send!
    self.canceled_at = Time.now
  end

  def cancelled?
    !!self.canceled_at
  end
end
