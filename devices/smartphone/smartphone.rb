require './devices/smartphone/bike'

class Smartphone
  attr_accessor :user, :email

  def initialize(email)
    self.email = email
  end

  def login
    self.user = self.email
  end

  def logout
    self.user = nil
  end

  def pick_bike
    bikes = Bike.available
    bike = bikes.sample
  end

  def book_bike(bike)
    b = Booking.new user, bike
    b.save!
  end

  def cancel_booking(ride_id)
  end

  def beep
  end
end
