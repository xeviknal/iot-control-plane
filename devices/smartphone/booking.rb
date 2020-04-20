require './devices/smartphone/messages/bookings/create'

class Booking
  attr_accessor :user, :bike, :created_at, :canceled_at

  def initialize(user, bike)
    self.user = user
    self.bike = bike
  end

  # Todo: notify to API
  def save!
    BookingCreateMessage.new("#{self.user}/#{self.bike.id}").send!
    self.created_at = Time.now

    self
  end

  def cancel!
    self.canceled_at = Time.now
  end

  def cancelled?
    !!self.canceled_at
  end
end
